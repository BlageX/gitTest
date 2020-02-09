package io.isaBackend.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.TipPregledaDTO;
import io.isaBackend.model.klinika.TipPregleda;
import io.isaBackend.service.TipPregledaService;


@RestController
public class TipPregledaController {

	@Autowired
	private TipPregledaService tipPregledaService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/tipPregleda", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TipPregledaDTO>> getAllTipPregleda() {
	
		List<TipPregleda> allTipPregleda = tipPregledaService.getAllTipPregleda();
		
		List<TipPregledaDTO> tipPregledaDTO = new ArrayList<>();
		for (TipPregleda tp : allTipPregleda) {
			tipPregledaDTO.add(new TipPregledaDTO(tp));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(tipPregledaDTO, HttpStatus.OK);

	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/tipPregleda/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<TipPregledaDTO> getTipPregleda(@PathVariable("id") Long id){
		
		TipPregleda tipPregleda = tipPregledaService.findOne(id);
		//return radnikService.getRadnik(id);
		if (tipPregleda == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new TipPregledaDTO(tipPregleda), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/tipPregleda",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<TipPregledaDTO> addTipPregleda(@RequestBody TipPregledaDTO tipPregledaDTO)  throws Exception {
		TipPregleda savedTipPregleda = new TipPregleda();
		savedTipPregleda.setId(tipPregledaDTO.getId());
		savedTipPregleda.setNaziv(tipPregledaDTO.getNaziv());		
		
		savedTipPregleda= tipPregledaService.addTipPregleda(savedTipPregleda);
		return new ResponseEntity<>(new TipPregledaDTO(savedTipPregleda), HttpStatus.CREATED);
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/tipPregleda", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<TipPregledaDTO> updateTipPregleda(@RequestBody TipPregledaDTO tipPregledaDTO) throws Exception{
		
		TipPregleda updatedTipPregleda = tipPregledaService.findOne(tipPregledaDTO.getId());
		
		if (updatedTipPregleda == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an radnik only
		updatedTipPregleda.setId(tipPregledaDTO.getId());
		updatedTipPregleda.setNaziv(tipPregledaDTO.getNaziv());
	
		updatedTipPregleda = tipPregledaService.updateTipPregleda(updatedTipPregleda.getId(), updatedTipPregleda);
		return new ResponseEntity<>(new TipPregledaDTO(updatedTipPregleda), HttpStatus.OK);
	}

	
	//DELET	
	@RequestMapping(value="/tipPregleda/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteTipPregleda(@PathVariable Long id) {
		
		TipPregleda tipPregleda = tipPregledaService.findOne(id);
		if (tipPregleda != null) {
			tipPregledaService.deleteTipPregleda(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
	
	//GET TipPregleda By Klinika
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(method=RequestMethod.GET, value="klinika/{id}/tipPregledaByKlinika", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TipPregledaDTO>> getAllTipPregledaByKlinikaId(@PathVariable Long id) {
	
		List<TipPregleda> allTipPregleda = tipPregledaService.getAllTipPregledaByKlinikeId(id);
		
		List<TipPregledaDTO> tipPregledaDTO = new ArrayList<>();
		for (TipPregleda tp : allTipPregleda) {
			tipPregledaDTO.add(new TipPregledaDTO(tp));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(tipPregledaDTO, HttpStatus.OK);

	}
}
