package io.isaBackend.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import io.isaBackend.dto.KlinikaDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.service.DoktorService;
import io.isaBackend.service.KlinikaService;
import io.isaBackend.service.TerminService;

@RestController
public class KlinikaController {
	
	@Autowired
	private KlinikaService klinikaService;
	
	@Autowired
	private DoktorService doktorService;
	
	@Autowired
	private TerminService terminService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/klinika", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<KlinikaDTO>> getAllKlinika() {
	
		List<Klinika> allKlinke = klinikaService.getAllKlinika();
		
		List<KlinikaDTO> klinikaDTO = new ArrayList<>();
		for (Klinika k : allKlinke) {
			klinikaDTO.add(new KlinikaDTO(k));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(klinikaDTO, HttpStatus.OK);
	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/klinika/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<KlinikaDTO> getKlinika(@PathVariable("id") Long id){
		
		Klinika klinika = klinikaService.findOne(id);
		if (klinika == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new KlinikaDTO(klinika), HttpStatus.OK);
	}
	
	//POST ni ne pokusavati radi, ali ne potpuno
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/klinika",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<KlinikaDTO> addKlinika(@RequestBody KlinikaDTO klinikaDTO)  throws Exception {
		
		//OVO JE KOD KOJI RADI KADA TREBA DA SE DODA VISE ELEMENATA ODJEDNOM, ali ovde ne radi jer se u bazi
		//ne cuva nigde veza izmedju nove klinike i postojecih doktora posto je u modelu u tabeli doktor id_klinike;
		if (klinikaDTO.getDoktori() == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		
		Set<DoktorDTO> doctors = klinikaDTO.getDoktori();
		Set<Doktor> doktori = new HashSet<Doktor>();
		
		//prebacivanje iz DTO u model
		for (DoktorDTO d : doctors) {
			System.out.println("doctors_id:" + d.getId());
			doktori.add(doktorService.findOne(d.getId()));
		}
				
		//dovde;
		
		Klinika savedKlinika = new Klinika();
		savedKlinika.setId(klinikaDTO.getId());
		savedKlinika.setNaziv(klinikaDTO.getNaziv());
		savedKlinika.setAdresa(klinikaDTO.getAdresa());
		savedKlinika.setOpis(klinikaDTO.getOpis());
		savedKlinika.setCene(klinikaDTO.getCene());
		savedKlinika.setOcena(klinikaDTO.getOcena());
		

		savedKlinika.setDoktori(doktori);
	
		savedKlinika = klinikaService.addKlinika(savedKlinika);
		return new ResponseEntity<>(new KlinikaDTO(savedKlinika), HttpStatus.CREATED);
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/klinika", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<KlinikaDTO> updateKlinika(@RequestBody KlinikaDTO klinikaDTO) throws Exception{
		
		Klinika updatedKlinika = klinikaService.findOne(klinikaDTO.getId());
		
		if (updatedKlinika == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		
		// we allow changing date and points for an klinika only 
		updatedKlinika.setId(klinikaDTO.getId());
		updatedKlinika.setNaziv(klinikaDTO.getNaziv());
		updatedKlinika.setAdresa(klinikaDTO.getAdresa());
		updatedKlinika.setOpis(klinikaDTO.getOpis());
		updatedKlinika.setCene(klinikaDTO.getCene());
		updatedKlinika.setOcena(klinikaDTO.getOcena());

		updatedKlinika  = klinikaService.updateKlinika(updatedKlinika.getId(),updatedKlinika);
		return new ResponseEntity<>(new KlinikaDTO(updatedKlinika), HttpStatus.OK);
	}

	//DELET
	@RequestMapping(value="/klinika/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteKlinika(@PathVariable Long id) {
		
		Klinika klinika = klinikaService.findOne(id);
		if (klinika != null) {
			klinikaService.deleteKlinika(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
	
	//DODAO:
	@PreAuthorize("hasRole('PACIJENT')")
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/klinika/search", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<KlinikaDTO>> getSearchedKlinika(@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate datum, @RequestParam String tipPregleda){		
		String testNazivPregled = tipPregleda;
		LocalDate testDatum = datum;
		
		
		List<Klinika> allKlinike = terminService.findKlinikaByTipPregledaAndDatum(testNazivPregled, testDatum);
		
		if(allKlinike ==null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}		
		
		List<KlinikaDTO> klinikaDTO = new ArrayList<>();
		for (Klinika k : allKlinike) {
			klinikaDTO.add(new KlinikaDTO(k));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(klinikaDTO, HttpStatus.OK);
	}	
}