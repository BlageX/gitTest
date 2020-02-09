package io.isaBackend.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import io.isaBackend.dto.IzvestajPregledaDTO;
import io.isaBackend.dto.KlinikaDTO;
import io.isaBackend.dto.PacijentDTO;
import io.isaBackend.dto.RegistrovanjeDTO;
import io.isaBackend.dto.ZdravstveniKartonDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.report.ZdravstveniKarton;
import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.model.user.Authority;
import io.isaBackend.model.user.Pacijent;
import io.isaBackend.model.user.User;
import io.isaBackend.model.user.UserTokenState;
import io.isaBackend.security.auth.JwtAuthenticationRequest;
import io.isaBackend.security.exception.ResourceConflictException;
import io.isaBackend.security.security.TokenUtils;
import io.isaBackend.service.AuthorityService;
import io.isaBackend.service.PacijentService;
import io.isaBackend.service.UserService;
import io.isaBackend.service.ZdravstveniKartonService;
import io.isaBackend.service.impl.EmailService;

//import com.isa.backend.dto.PatientDTO;
 
@RestController
//@RequestMapping(value = "/pacijent")
public class PacijentController {

	@Autowired
	private PacijentService pacijentService;
	
	@Autowired
	private ZdravstveniKartonService zdrKartonService;
	
	@Autowired
	private AuthorityService authService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	TokenUtils tokenUtils;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	private Logger logger = LoggerFactory.getLogger(PacijentController.class);

	@Autowired
	private EmailService emailService;

	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/pacijent", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PacijentDTO>> getAllPacijent() {
	
		List<Pacijent> allPacijent = pacijentService.getAllPacijent();
		
		List<PacijentDTO> pacijentDTO = new ArrayList<>();
		for (Pacijent p : allPacijent) {
			pacijentDTO.add(new PacijentDTO(p));
		}
		// convert pacijent to DTOs
		return new ResponseEntity<>(pacijentDTO, HttpStatus.OK);

	}
	
	//GET
	//@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.GET, value="/pacijent/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PacijentDTO> getPacijent(@PathVariable("id") Long id){
		
		Pacijent pacijent = pacijentService.findOne(id);
		//return radnikService.getRadnik(id);
		if (pacijent == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new PacijentDTO(pacijent), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/pacijent",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PacijentDTO> addPacijent(@RequestBody PacijentDTO pacijentDTO)  throws Exception {
		
		// a new exam must can't have zdravstveniKarton defined
		if (pacijentDTO.getZdravstveniKarton() == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
				
		//Dok kreiram pacijenta kreira se automatski i novi prazan zdravstveni karton za njega:

		ZdravstveniKartonDTO savedZdrKarton = pacijentDTO.getZdravstveniKarton();
		ZdravstveniKarton zdrKarton = new ZdravstveniKarton();
		zdrKarton = zdrKartonService.addZdravstveniKarton(zdrKarton);
		
		Pacijent savedPacijent = new Pacijent();
		savedPacijent.setIme(pacijentDTO.getIme());
		savedPacijent.setPrezime(pacijentDTO.getPrezime());
		savedPacijent.setAdresa(pacijentDTO.getAdresa());
		savedPacijent.setGrad(pacijentDTO.getGrad());
		savedPacijent.setDrzava(pacijentDTO.getDrzava());
		savedPacijent.setBrojTelefona(pacijentDTO.getBrojTelefona());
		savedPacijent.setBrojOsiguranika(pacijentDTO.getBrojOsiguranika());
	
		savedPacijent.setZdravstveniKarton(zdrKarton);
		
		savedPacijent = pacijentService.addPacijent(savedPacijent);
		return new ResponseEntity<>(new PacijentDTO(savedPacijent), HttpStatus.CREATED);
	}
	
	
	//PUT
	
	@RequestMapping(method=RequestMethod.PUT, value="/updatePacijent", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PacijentDTO> updatePacijent(@Valid @RequestBody RegistrovanjeDTO pacijentDTO) throws Exception{
		
		System.out.println("Usao u update profile!");
		Pacijent updatedPacijent = pacijentService.findOne(pacijentDTO.getId());
		
		if (updatedPacijent == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an pacijent only
		updatedPacijent.setId(pacijentDTO.getId());
		updatedPacijent.setIme(pacijentDTO.getIme());
		updatedPacijent.setPrezime(pacijentDTO.getPrezime());
		updatedPacijent.setAdresa(pacijentDTO.getAdresa());
		updatedPacijent.setGrad(pacijentDTO.getGrad());
		updatedPacijent.setDrzava(pacijentDTO.getDrzava());
		updatedPacijent.setBrojTelefona(pacijentDTO.getBrojTelefona());
		//updatedPacijent.setBrojOsiguranika(pacijentDTO.getBrojOsiguranika());
		
		System.out.println("Izlazim iz update profile!");
		updatedPacijent = pacijentService.updatePacijent(updatedPacijent.getId(), updatedPacijent);
		return new ResponseEntity<>(new PacijentDTO(updatedPacijent), HttpStatus.OK);
	}
	
	//DELET	
	@RequestMapping(value="/pacijent/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deletePacijent(@PathVariable Long id) {
		
		Pacijent pacijent = pacijentService.findOne(id);
		if (pacijent != null) {
			pacijentService.deletePacijent(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}

	
	//Slucajni codeGenerator za registraciju putem email
	public String registrationCodeGenarator() {
		 int leftLimit = 97; // letter 'a'
		    int rightLimit = 122; // letter 'z'
		    int targetStringLength = 10;
		    Random random = new Random();
		    StringBuilder buffer = new StringBuilder(targetStringLength);
		    for (int i = 0; i < targetStringLength; i++) {
		        int randomLimitedInt = leftLimit + (int) 
		          (random.nextFloat() * (rightLimit - leftLimit + 1));
		        buffer.append((char) randomLimitedInt);
		    }
		    String generatedCode = buffer.toString();
		 
		    System.out.println("generatedCode: " + generatedCode);
		return generatedCode;
	}
	
	public String randomVisina() {
		int minVisina = 160;
		int maxVisina = 210;
		int rezVisina = (int) (Math.floor(Math.random() * (maxVisina - minVisina + 1)) + minVisina);
		return Integer.toString(rezVisina);
	}
	
	public String randomTezina() {
		int minTezina = 60;
		int maxTezina = 120;
		int rezTezina = (int) (Math.floor(Math.random() * (maxTezina - minTezina + 1)) + minTezina);
		return Integer.toString(rezTezina);
	}
	
	public String randomKrvnaGrupa() {
		String[] krvneGrupe = {"A", "B", "0", "AB", "A+", "B-" };
		int index = (int) (Math.floor(Math.random() * (5 - 0)) + 0);
		return krvneGrupe[index];
	}
	
	public String randomDioptrija() {
		String[] dioptrije = { "nema dioptriju", "+0.5", "-0.5", "nema dioptriju", "+1", "-1", "+1.5", "-1.5"};
		int index = (int) (Math.floor(Math.random() * (7 - 0)) + 0);
		return dioptrije[index];
	}
	
	public String randomAlergije() {
		String[] alergije = {"zeceve,polen,prasinu", "Nema alergije", "polen", "prasinu","kikiriki", "gluten", "kikiriki,gluten", "Nema alergije"};
		int index = (int) (Math.floor(Math.random() * (8 - 0)) + 0);
		return alergije[index];
	}
	
//url ("auth/signup")
//POST REGISTRACIJA po defaultu pri registraciji je korisnik pacijent, a da li ce biti prebacen na doktora, sestru... to radi admin...
//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/pacijentLogin",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PacijentDTO> registrujPacijenta(@Valid @RequestBody RegistrovanjeDTO regDTO, UriComponentsBuilder ucBuilder)  throws Exception {
		
		//Proveravam provo da li takav user postoji ako da izbacim gresku...
		User existUser = this.userService.findByUsername(regDTO.getUsername());
		if (existUser != null) {
			throw new ResourceConflictException(regDTO.getId(), "Username already exists you mappet!");
		}
				
		//Dok kreiram pacijenta kreira se automatski i novi prazan zdravstveni karton za njega:
	
//		ZdravstveniKartonDTO savedZdrKarton = regDTO.getZdravstveniKarton();
		ZdravstveniKarton zdrKarton = new ZdravstveniKarton();
		zdrKarton.setVisina(randomVisina());
		zdrKarton.setTezina(randomTezina());
		zdrKarton.setKrvnaGrupa(randomKrvnaGrupa());
		zdrKarton.setDioptrija(randomDioptrija());
		zdrKarton.setAlergija(randomAlergije());
		zdrKarton = zdrKartonService.addZdravstveniKarton(zdrKarton);
		
		Pacijent savedPacijent = new Pacijent();
		//savedPacijent.setId(pacijentDTO.getId());
		savedPacijent.setUsername(regDTO.getUsername());
		savedPacijent.setPassword(passwordEncoder.encode(regDTO.getPassword()));
		savedPacijent.setIme(regDTO.getIme());
		savedPacijent.setPrezime(regDTO.getPrezime()); 
		savedPacijent.setAdresa(regDTO.getAdresa());
		savedPacijent.setGrad(regDTO.getGrad());
		savedPacijent.setDrzava(regDTO.getDrzava());
		savedPacijent.setBrojTelefona(regDTO.getBrojTelefona());
		savedPacijent.setBrojOsiguranika(regDTO.getBrojOsiguranika());
		savedPacijent.setEmail(regDTO.getEmail());
		savedPacijent.setZdravstveniKarton(zdrKarton);
		
		//za prijavu preko mejla
		savedPacijent.setEnabled(false);
		savedPacijent.setRegistrationCode(registrationCodeGenarator());
	
		List<Authority> auth = authService.findByName("ROLE_PACIJENT");
		savedPacijent.setAuthorities(auth);		
		
		savedPacijent = pacijentService.addPacijent(savedPacijent);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/user/{userId}").buildAndExpand(savedPacijent.getId()).toUri());
		
		//slanje emaila
		try {
			emailService.sendNotificaitionAsync(savedPacijent);
		}catch( Exception e ){
			logger.info("Greska prilikom slanja emaila: " + e.getMessage());
		}

		
		return new ResponseEntity<>(new PacijentDTO(savedPacijent), HttpStatus.CREATED);
	}
}
