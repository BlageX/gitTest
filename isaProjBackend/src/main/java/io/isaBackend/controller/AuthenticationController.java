package io.isaBackend.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;


import io.isaBackend.dto.PredefPregledDTO;
import io.isaBackend.dto.RegistrovanjeDTO;
import io.isaBackend.dto.UserRequest;
import io.isaBackend.dto.VerifikacijaDTO;

import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.klinika.Sala;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.Pacijent;
import io.isaBackend.model.user.User;

import io.isaBackend.service.DoktorService;
import io.isaBackend.service.IzvestajPregledaService;
import io.isaBackend.service.PacijentService;
import io.isaBackend.service.PregledService;
import io.isaBackend.service.ReceptService;
import io.isaBackend.service.TerminService;
import io.isaBackend.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;

import io.isaBackend.model.user.UserTokenState;
import io.isaBackend.security.auth.JwtAuthenticationRequest;

import io.isaBackend.security.security.TokenUtils;
import io.isaBackend.service.impl.CustomUserDetailsService;

//Kontroler zaduzen za autentifikaciju korisnika bukvanlo kontroller za user klasu
@RestController
//@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthenticationController {

	@Autowired
	TokenUtils tokenUtils;

	@Autowired
	@Lazy
	private AuthenticationManager authenticationManager;

	@Autowired
	private CustomUserDetailsService userDetailsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PacijentService	pacijentService;
	
	@Autowired
	private PregledService predefPregledService;

	@Autowired
	private TerminService terminService;
	
	@Autowired
	private DoktorService doktorService;
	
	@Autowired
	private IzvestajPregledaService izvPregledaService;
	
	@Autowired
	private PregledService pregledService;
	
	//GET ALL	
		@RequestMapping(method=RequestMethod.GET, value="/users", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<UserRequest>> getAllUsers() throws Exception {
		
			List<User> allUser = userService.findAll();
			
			List<UserRequest> userDTO = new ArrayList<>();
			for (User u : allUser) {
				userDTO.add(new UserRequest(u));
			}
			// convert pacijent to DTOs
			return new ResponseEntity<>(userDTO, HttpStatus.OK);
		}
		
		//GET 	
		@RequestMapping(method=RequestMethod.GET, value="/user", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<RegistrovanjeDTO> getPacijent(@RequestBody User user){
			//User user = userService.findByUsername(username);
			
			Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
			if (pacijent == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(new RegistrovanjeDTO(pacijent), HttpStatus.OK);
		}
		
		//GET 	
		@RequestMapping(method=RequestMethod.GET, value="/userProfile", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<RegistrovanjeDTO> getPacijent(HttpServletRequest request){
			//User user = userService.findByUsername(username);
			String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
			String username = tokenUtils.getUsernameFromToken(token);
			User user = (User) userDetailsService.loadUserByUsername(username);
			Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
			if (pacijent == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(new RegistrovanjeDTO(pacijent), HttpStatus.OK);
			
		}

	//kada nemam token vec samo username i password
	@RequestMapping(value = "/auth/login", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtAuthenticationRequest authenticationRequest,
			HttpServletResponse response) throws AuthenticationException, IOException {
		System.out.println("Usao u auth/login: ");
		System.out.println("Username: " + authenticationRequest.getUsername());
		System.out.println("Password: " + authenticationRequest.getPassword());
		
		System.out.println("Dosao dovde 0!");
		
		final Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(),
						authenticationRequest.getPassword()));
		
		System.out.println("authinaction: " + authentication.getName());

		System.out.println("Dosao dovde 1!");
			
		// Ubaci username + password u kontext
		SecurityContextHolder.getContext().setAuthentication(authentication);
		System.out.println("Dosao dovde 2!");
		
		// Kreiraj token
		User user = (User) authentication.getPrincipal();
		System.out.println("Dosao dovde 3!");
		
		Pacijent pacijent = (Pacijent) userService.findByUsername(authenticationRequest.getUsername());
		String jwt = tokenUtils.generateToken(user.getUsername(), pacijent.getRole());
		
		System.out.println("Kreirani Token: " + jwt);
		System.out.println("LastPasswotdResetDate: "+ user.getLastPasswordResetDate());
		System.out.println("TokenIsparationDate: "+ tokenUtils.getExpirationDateFromToken(jwt));
	
		int expiresIn = tokenUtils.getExpiredIn();

		// Vrati token kao odgovor na uspesno autentifikaciju
		return ResponseEntity.ok(new UserTokenState(jwt, expiresIn, pacijent.getRole())); 
	}	
	
	@RequestMapping(method=RequestMethod.POST, value="/pacijent/verify",consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> verifikacijaPacijenta(@Valid @RequestBody VerifikacijaDTO request, UriComponentsBuilder ucBuilder)  throws Exception {
		System.out.println("Usao u verifikacijaPacijenta: ");
		System.out.println("Prosledjeni kod: "  + request.getRegistrationCode().toString());
	
		String generisaniKod = request.getRegistrationCode().toString();
		
		User registratedUser = userService.findByRegistrationCode(generisaniKod);
		
		if(registratedUser != null) {
			Pacijent pacijent = (Pacijent) userService.findById(registratedUser.getId());
			pacijent.setEnabled(true);
			System.out.println("Pacijent enabled: "  + registratedUser.isEnabled());
			System.out.println("Pacijent username: "  + registratedUser.getUsername());
			System.out.println("Pacijent password: "  + registratedUser.getPassword());
			
			pacijentService.updatePacijent(pacijent.getId(),pacijent);
			return ResponseEntity.ok().build();
			
		}

		return ResponseEntity.badRequest().build();
	}
	
	
	//ZAKAZIVANJE PREDEFPREGLED
	//DODATO ZA SETOVANJE ID PACIJENTA KOJI JE IZABRAO PREDEF PREGLED IZ LISTE U OKVIRU PROFILA KLINIKE
	//PUT
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.PUT, value="/zakaziPregled", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PredefPregledDTO> updatePredefPregledWithPacijentId(@RequestBody PredefPregledDTO predefPregledDTO,HttpServletRequest request) throws Exception{
		
		String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
		String username = tokenUtils.getUsernameFromToken(token);
		User user = (User) userDetailsService.loadUserByUsername(username);
		
		Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
		if (pacijent == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		Pregled updatedPredefPregled =  predefPregledService.findOne(predefPregledDTO.getId());
		
		if (updatedPredefPregled == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		updatedPredefPregled.setPacijent(pacijent);

		updatedPredefPregled = predefPregledService.updatePregled(updatedPredefPregled.getId(), updatedPredefPregled);
		return new ResponseEntity<>(new PredefPregledDTO(updatedPredefPregled), HttpStatus.OK);
	}
	
	
		//OTKAZIVANJE PREDEFPREGLED
		//DODATO ZA SETOVANJE ID PACIJENTA KOJI JE IZABRAO PREDEF PREGLED IZ LISTE U OKVIRU PROFILA KLINIKE
		//PUT
		@PreAuthorize("hasRole('PACIJENT')")
		@RequestMapping(method=RequestMethod.PUT, value="/otkaziPregled", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<PredefPregledDTO> removePacijentIdPregled(@RequestBody PredefPregledDTO predefPregledDTO, HttpServletRequest request) throws Exception{
			
			String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
			String username = tokenUtils.getUsernameFromToken(token);
			User user = (User) userDetailsService.loadUserByUsername(username);
			
			Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
			if (pacijent == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			Pregled updatedPregled =  predefPregledService.findOne(predefPregledDTO.getId());
			
			if (updatedPregled  == null) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			LocalDateTime datumOtkazivanja = LocalDateTime.now();
			System.out.println("dateOtkazivanja: " + datumOtkazivanja);
			
			LocalDateTime datumPregleda = LocalDateTime.of(updatedPregled.getDatum(), updatedPregled.getVreme());
						
			int days = (int) ChronoUnit.DAYS.between(datumOtkazivanja, datumPregleda);
			System.out.println("days between: " + days);
			
	
			if(days <= 1) {	
				updatedPregled.setProsao(true);
				updatedPregled = predefPregledService.updatePregled(updatedPregled.getId(), updatedPregled);
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			if(updatedPregled.getTerminId()!=null) {
				//provera termina jer predef pregledi nemaju termin;
				Termin termin = terminService.findOne(updatedPregled.getTerminId());
				if(termin != null && termin.isSlobodan()==false) {
					termin.setSlobodan(true);
				}
			}
			updatedPregled.setPacijent(null); 
	
			updatedPregled = predefPregledService.updatePregled(updatedPregled.getId(), updatedPregled);
			return new ResponseEntity<>(new PredefPregledDTO(updatedPregled), HttpStatus.OK);
		}

		//DODATO ZA DOBIJANJE LISTE PREGLEDA NA OSNOVU ID PACIJENTA I PRIKAZA DELA PODATAKA U LISTI IZVESTAJA PREGLEDA A I U ISTORIJI PREGLEDA
		@PreAuthorize("hasRole('PACIJENT')")
		@RequestMapping(method=RequestMethod.GET, value="pacijent/zdravstveniKarton/pregled", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<PredefPregledDTO>> getAllPregledOfPacijent(HttpServletRequest request) {
			
			String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
			String username = tokenUtils.getUsernameFromToken(token);
			User user = (User) userDetailsService.loadUserByUsername(username);
			
			Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
			if (pacijent == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			List<Pregled> allPregled = pregledService.getAllByPacijentId(pacijent.getId());
			
			List<PredefPregledDTO> pregledDTO = new ArrayList<>();
			for (Pregled p : allPregled) {
				if(p.isProsao() == true) {
					pregledDTO.add(new PredefPregledDTO(p));
				}
				
			}
			// convert adminClinic to DTOs
			return new ResponseEntity<>(pregledDTO, HttpStatus.OK);
		}
	
	//DODATO ZA DOBIJANJE LISTE ZAKAZANIH (PREDEF) PREGLEDA NA OSNOVU ID PACIJENTA I PRIKAZA U ZAKAZANI PREGLEDI
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.GET, value="/getZakazaniPregledi", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PredefPregledDTO>>getPredefPregledForPacijent(HttpServletRequest request) {
			
		String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
		String username = tokenUtils.getUsernameFromToken(token);
		User user = (User) userDetailsService.loadUserByUsername(username);
		
		Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
		if (pacijent == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		List<Pregled> allPregled = predefPregledService.getAllByPacijentId(pacijent.getId());
		
		List<PredefPregledDTO> predefPregledDTO = new ArrayList<>();
		

		for (Pregled p : allPregled) {
			if(p.isProsao()!=true) {
				predefPregledDTO.add(new PredefPregledDTO(p));	
			}
		}
		
		// convert pregled to DTOs
		return new ResponseEntity<>(predefPregledDTO, HttpStatus.OK);

	}	
	//kada kliknem potvrdi treba jos jedna metoda POST...argumenti isto id i httpRequest da izvucem pacijenta...,   iz pacijenta i  termina uzimam sve sto mi treba kazem iz termina uzimam vremena i smestam ih u pregled uzimama id pacijenta i mapiram na pregled kao i doktora koji je vezan sa pregledom... 
	//mogu vratiti id pregleda koji ...
	
	//POST
	@PreAuthorize("hasRole('PACIJENT')")
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/customPregled/{termin_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PredefPregledDTO> addCustomPregled(@PathVariable Long termin_id, HttpServletRequest request) throws Exception {
			
		//Izvucem pacijenta iz httpServletRequesta:
		String token = tokenUtils.getToken(request);//get token izvuce token i vrati ga;
		
		String username = tokenUtils.getUsernameFromToken(token);
		User user = (User) userDetailsService.loadUserByUsername(username);
		
		Pacijent pacijent = (Pacijent) userService.findByUsername(user.getUsername());
		if (pacijent == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		//Izvucem termin preko id termina
		if(termin_id == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST); //400
		}
		System.out.println("termin_id: " + termin_id);
		
		//trebaju mi datum i vremene iz te klinike dobijeni preko id klinike;
		Termin termin = terminService.findOne(termin_id);
	
		//trebaju mi ime,prezime doktora naziv tip pregleda i cena tipa pregleda dobijeni preko id termina;
		Doktor doktor = this.doktorService.getDoktorByTerminId(termin_id);
		
		//Kazem da je taj termin zauzet:
		termin.setSlobodan(false); 
		
		//sve to setuj u pregled i vrati ga nazad...
		
		//Dok kreiram pregled kreira se automatski i novi prazan pregled karton za njega:
		//Sala sala = automatski dodelim nakako sali i vratim mej pacijentu u kojem kaze koja sala i svi ovi podaci... 

		//IzvestajPregledaDTO savedIzvPregled = predefPregledDTO.getIzvPregleda();
		Long id = (long) 1;
		IzvestajPregleda izvPregleda = izvPregledaService.findOne(id); //isto automatski popunim
		Sala sala = new Sala("Sala za pregled","1",false);
		
		
		Pregled saveCustomPregled = new Pregled();
		saveCustomPregled.setTerminId(termin_id);
		saveCustomPregled.setDatum(termin.getDatum()); 
		saveCustomPregled.setVreme(termin.getPocetakTermina());
		saveCustomPregled.setTrajanje(ChronoUnit.MINUTES.between(termin.getPocetakTermina(),termin.getKrajTermina()));
		saveCustomPregled.setCena(doktor.getTipPregleda().getCena());
		
		saveCustomPregled.setTipPregleda(doktor.getTipPregleda());
		saveCustomPregled.setDoktor(doktor);
		saveCustomPregled.setPacijent(pacijent);

		
		saveCustomPregled.setSala(sala);
		saveCustomPregled.setIzvestajPregleda(izvPregleda);
		
		saveCustomPregled = predefPregledService.addPregled(saveCustomPregled);
		return new ResponseEntity<>(new PredefPregledDTO(saveCustomPregled), HttpStatus.CREATED);
	}
	
	
}