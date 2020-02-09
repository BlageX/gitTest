package io.isaBackend.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.DoktorDTO;
import io.isaBackend.dto.OverviewDTO;
import io.isaBackend.dto.PredefPregledDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.klinika.Sala;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.model.klinika.TipPregleda;
import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.Pacijent;
import io.isaBackend.model.user.User;
import io.isaBackend.service.DoktorService;
import io.isaBackend.service.IzvestajPregledaService;
import io.isaBackend.service.KlinikaService;
import io.isaBackend.service.PacijentService;
import io.isaBackend.service.PregledService;
import io.isaBackend.service.SalaService;
import io.isaBackend.service.TerminService;
import io.isaBackend.service.TipPregledaService;


@RestController
public class PregledController {

	@Autowired
	private PregledService predefPregledService;
	
	@Autowired
	private TipPregledaService tipPregledaService;
	
	@Autowired
	private SalaService salaService;
	
	@Autowired
	private DoktorService doktorService;
	
	@Autowired
	private PacijentService pacijentService;
	
	@Autowired
	private IzvestajPregledaService izvPregledService;
	
	@Autowired
	private TerminService terminService;
	
	@Autowired
	private KlinikaService klinikaService;
	
	
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/pregled", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PredefPregledDTO>> getAllPredefPregled() {
	
		List<Pregled> allPregled = predefPregledService.getAllPregled();
		
		List<PredefPregledDTO> predefPregledDTO = new ArrayList<>();
		for (Pregled p : allPregled) {
			predefPregledDTO.add(new PredefPregledDTO(p));
		}
		
		// convert pregled to DTOs
		return new ResponseEntity<>(predefPregledDTO, HttpStatus.OK);

	}
		
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/pregled/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PredefPregledDTO> getPredefPregled(@PathVariable("id") Long id){
		
		Pregled predefPregled =  predefPregledService.findOne(id);

		if (predefPregled  == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new PredefPregledDTO(predefPregled), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/pregled",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PredefPregledDTO> addPredefPregled(@RequestBody PredefPregledDTO predefPregledDTO) throws Exception {
		
		if (predefPregledDTO.getTipPregleda() == null || predefPregledDTO.getSala() == null  || predefPregledDTO.getDoktor() == null || predefPregledDTO.getPacijent() == null /*|| predefPregledDTO.getIzvPregleda() == null*/) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		TipPregleda tipPregleda = tipPregledaService.findOne(predefPregledDTO.getTipPregleda().getId());
		Pacijent pacijent = pacijentService.findOne(predefPregledDTO.getPacijent().getId());
		Doktor doktor = doktorService.findOne(predefPregledDTO.getDoktor().getId());
		Sala sala = salaService.findOne(predefPregledDTO.getSala().getId());
		
		//Dok kreiram pregled kreira se automatski i novi prazan pregled karton za njega:
//		IzvestajPregledaDTO savedIzvPregled = predefPregledDTO.getIzvPregleda();
		IzvestajPregleda izvPregleda = new IzvestajPregleda();
		
		
		izvPregleda = izvPregledService.addIzvestajPregleda(izvPregleda);
		
	
		if (tipPregleda == null || sala == null  || pacijent == null || doktor == null /* || izvPregleda==null*/) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		Pregled savedPredefPregled = new Pregled();
		savedPredefPregled.setId(predefPregledDTO.getId());
		savedPredefPregled.setDatum(predefPregledDTO.getDatum()); 
		savedPredefPregled.setVreme(predefPregledDTO.getVreme());
		savedPredefPregled.setTrajanje(predefPregledDTO.getTrajanje());
		savedPredefPregled.setCena(predefPregledDTO.getCena());
		
		savedPredefPregled.setTipPregleda(tipPregleda);
		savedPredefPregled.setSala(sala);
		savedPredefPregled.setDoktor(doktor);
		savedPredefPregled.setPacijent(pacijent);
		savedPredefPregled.setIzvestajPregleda(izvPregleda);
		
		savedPredefPregled = predefPregledService.addPregled(savedPredefPregled);
		return new ResponseEntity<>(new PredefPregledDTO(savedPredefPregled), HttpStatus.CREATED);
	}

	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/pregled", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PredefPregledDTO> updatePredefPregled(@RequestBody PredefPregledDTO predefPregledDTO) throws Exception{
		
		Pregled updatedPredefPregled =  predefPregledService.findOne(predefPregledDTO.getId());
		
		if (updatedPredefPregled == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an predefPregled only
		updatedPredefPregled.setId(predefPregledDTO.getId());
		updatedPredefPregled.setDatum(predefPregledDTO.getDatum()); 
		updatedPredefPregled.setVreme(predefPregledDTO.getVreme());
		updatedPredefPregled.setTrajanje(predefPregledDTO.getTrajanje());
		updatedPredefPregled.setCena(predefPregledDTO.getCena());

		updatedPredefPregled = predefPregledService.updatePregled(updatedPredefPregled.getId(), updatedPredefPregled);
		return new ResponseEntity<>(new PredefPregledDTO(updatedPredefPregled), HttpStatus.OK);
	}

	
	//DELET	
	@RequestMapping(value="/pregled/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteKlinika(@PathVariable Long id) {
		
		Pregled predefPregled =  predefPregledService.findOne(id);
		if (predefPregled != null) {
			predefPregledService.deletePregled(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
	//DODAO:
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.GET, value="klinika/{id}/predefPregledFromKlinika", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PredefPregledDTO>>getPredefPregledFromKlinika(@PathVariable("id") Long id) {

			
			List<Pregled> allPregled = predefPregledService.getAllByKlinikaId(id);
			
			List<PredefPregledDTO> predefPregledDTO = new ArrayList<>();
			
			//zbog prikaza u guiju pitati Milana
			for (Pregled p : allPregled) {
				if(p.getPacijent() == null ) {
						
					predefPregledDTO.add(new PredefPregledDTO(p));
				}
				else {
					System.out.println("Ima pacijenta: " + p.getId());
				}
			}
			
			// convert pregled to DTOs
			return new ResponseEntity<>(predefPregledDTO, HttpStatus.OK);

	}
	
	//DODATO:

	//GET Overview custom pregleda
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.GET, value="/getOverview/{termin_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OverviewDTO>  getOverviewCustomPregleda(@PathVariable Long termin_id) {
	
		if(termin_id == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST); //400
		}
		System.out.println("termin_id: " + termin_id);
		OverviewDTO overviewDTO = new OverviewDTO();
		
		//trebaju mi datum i vremene iz te klinike dobijeni preko id klinike;
		Termin termin = terminService.findOne(termin_id);
		LocalDate datum = termin.getDatum();
		
		String vremePocetak = termin.getPocetakTermina().toString();
		String vremeKraj = termin.getKrajTermina().toString();
	
		//trebaju mi ime,prezime doktora naziv tip pregleda i cena tipa pregleda dobijeni preko id termina;
		
		Doktor doktor = doktorService.getDoktorByTerminId(termin_id);
		
//		System.out.println("Doktorov tip pregleda: " + doktor.getTipPregleda().getCena());		
		
		//treba mi naziv klinike dobijen preko doktorovogId();
		Klinika klinika = klinikaService.getKlinikaByDoktoriId(doktor.getId());

		//sve to setuj u overviewDTO i vrati ga nazad...
		
		overviewDTO.setIdTermina(termin_id);
		overviewDTO.setDatum(datum);
		overviewDTO.setVreme(vremePocetak + " - " + vremeKraj);
		overviewDTO.setDoktor(doktor.getIme() + " " + doktor.getPrezime());
		overviewDTO.setNazivKlinike(klinika.getNaziv());
		overviewDTO.setTipPregleda(doktor.getTipPregleda().getNaziv());
		overviewDTO.setCena(doktor.getTipPregleda().getCena());
		
		return new ResponseEntity<>(overviewDTO, HttpStatus.OK);
	}
}
