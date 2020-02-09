package io.isaBackend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.DoktorDTO;
import io.isaBackend.dto.DoktorFilterTerminiDTO;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.model.klinika.TipPregleda;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.service.DoktorService;
import io.isaBackend.service.TipPregledaService;

@RestController
public class DoktorController {
	
	@Autowired
	private DoktorService doktorService;
	
	@Autowired
	private TipPregledaService tipPregledaService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/doktor", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<DoktorDTO>> getAllDoktor() {
	
		List<Doktor> allDoktor = doktorService.getAllDoktor();
		
		List<DoktorDTO> doktorDTO = new ArrayList<>();
		for (Doktor d : allDoktor) {
			doktorDTO.add(new DoktorDTO(d));
		}
		// convert doktor to DTOs
		return new ResponseEntity<>(doktorDTO, HttpStatus.OK);

	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/doktor/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<DoktorDTO> getDoktor(@PathVariable("id") Long id){
		
		Doktor doktor = doktorService.findOne(id);
		
		if (doktor == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new DoktorDTO(doktor), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/doktor",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<DoktorDTO> addDoktor(@RequestBody DoktorDTO doktorDTO)  throws Exception {
	
		// a new exam must have student and course defined
		if (doktorDTO.getTipPregleda() == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		TipPregleda tipPregleda = tipPregledaService.findOne(doktorDTO.getTipPregleda().getId());
	
		if (tipPregleda == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}		

		
		Doktor savedDoktor = new Doktor();
		savedDoktor.setId(doktorDTO.getId());
		savedDoktor.setIme(doktorDTO.getIme());
		savedDoktor.setPrezime(doktorDTO.getPrezime());
		savedDoktor.setRadnoVreme(doktorDTO.getRadnoVreme());
		
		savedDoktor.setTipPregleda(tipPregleda);
		
		savedDoktor = doktorService.addDoktor(savedDoktor);
		return new ResponseEntity<>(new DoktorDTO(savedDoktor), HttpStatus.CREATED);
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/doktor", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<DoktorDTO> updateDoktor(@RequestBody DoktorDTO doktorDTO) throws Exception{
		
		Doktor updatedDoktor = doktorService.findOne(doktorDTO.getId());
		
		if (updatedDoktor == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		
		// we allow changing date and points for an doktor only
		updatedDoktor.setId(doktorDTO.getId());
		updatedDoktor.setIme(doktorDTO.getIme());
		updatedDoktor.setPrezime(doktorDTO.getPrezime());
		updatedDoktor.setRadnoVreme(doktorDTO.getRadnoVreme());
		
		updatedDoktor  = doktorService.updateDoktor(updatedDoktor.getId(),updatedDoktor);
		return new ResponseEntity<>(new DoktorDTO(updatedDoktor), HttpStatus.OK);
	}
	
	//DELET	
	@RequestMapping(value="/doktor/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteDoktor(@PathVariable Long id) {
		
		Doktor doktor = doktorService.findOne(id);
		if (doktor != null) {
			doktorService.deleteDoktor(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}

	//HAS role PACIJENT
	@PreAuthorize("hasRole('PACIJENT')")
	//GET ALL	Ovo gadljam i kada radim search u listi klinika i  kada radim search u listi doktora 
	@RequestMapping(method=RequestMethod.GET, value="/getDoktorByParams", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<DoktorFilterTerminiDTO>> getAllDoktorByKlinikaParams(@RequestParam Long klinikaId, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate datum, @RequestParam String tipPregleda) {
	
		String testNazivPregled = tipPregleda;
		System.out.println("Prosledjeni tip pregleda u getDoktorByParams: " + tipPregleda);
		
		List<Doktor> allDoktor = doktorService.findDoktorByKlinikaIdAndTipPregledaAndDatum(klinikaId, testNazivPregled, datum);
		
		List<DoktorFilterTerminiDTO> doktorFilterTerminiDTO = new ArrayList<>();
		
		for (Doktor doktor : allDoktor) {
				
			System.out.println("Doktor u getDoktorByParams:" + doktor.getIme());
			doktorFilterTerminiDTO.add(new DoktorFilterTerminiDTO(doktor, datum));
		}
		// convert doktor to DTOs
		return new ResponseEntity<>(doktorFilterTerminiDTO, HttpStatus.OK);

	}	
	
}