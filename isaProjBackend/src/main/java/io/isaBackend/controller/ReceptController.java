package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.LekDTO;
import io.isaBackend.dto.ReceptDTO;
import io.isaBackend.model.report.Lek;
import io.isaBackend.model.report.Recept;

import io.isaBackend.model.user.MedicinskaSestra;
import io.isaBackend.service.LekService;
import io.isaBackend.service.MedicinskaSestraService;
import io.isaBackend.service.ReceptService;

@RestController
public class ReceptController {

	@Autowired
	private ReceptService receptService;
	
	@Autowired
	private MedicinskaSestraService medSestraService;
	
	@Autowired
	private LekService lekService;
	
	@RequestMapping(value="/recept", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReceptDTO>> getAllRecept() {
		List<Recept> recepti = receptService.getAllRecept();
		
		List<ReceptDTO> receptDTO = new ArrayList<>();
		for (Recept r : recepti) {
			receptDTO.add(new ReceptDTO(r));
		}
		// convert students to DTOs
		return new ResponseEntity<>(receptDTO, HttpStatus.OK);
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="/recept/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReceptDTO> getRadnik(@PathVariable("id") Long id){
		
		Recept recept = receptService.findOne(id);
		if (recept == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new ReceptDTO(recept), HttpStatus.OK);
	}

	//POST
	@RequestMapping(method=RequestMethod.POST, value="/recept",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReceptDTO> addRecept(@RequestBody ReceptDTO receptDTO) throws Exception {
		
		// a new exam must have medicinskaSestra and lekovi defined
		if (receptDTO.getMedSestra() == null  || receptDTO.getLekovi()==null ) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		MedicinskaSestra medSestra = medSestraService.findOne(receptDTO.getMedSestra().getId());
		
		Set<LekDTO> lekoviDTO = receptDTO.getLekovi();
		Set<Lek> lekovi = new HashSet<Lek>();
		
		//prebacivanje iz DTO u model
		for (LekDTO l : lekoviDTO) {
			//System.out.println("lek_id:" + l.getId());
			lekovi.add(lekService.findOne(l.getId()));
		}
		
		if (medSestra == null || lekovi == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		Recept savedRecept = new Recept();
		savedRecept.setId(receptDTO.getId());
		savedRecept.setMedSestra(medSestra);
		savedRecept.setLekovi(lekovi);
		
		savedRecept = receptService.addRecept(savedRecept);
		return new ResponseEntity<>(new ReceptDTO(savedRecept), HttpStatus.CREATED);
		
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/recept", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReceptDTO> updateRecept(@RequestBody ReceptDTO receptDTO) throws Exception{
		
		Recept updatedRecept = receptService.findOne(receptDTO.getId());
	
		if (updatedRecept == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an recept only
		updatedRecept.setId(receptDTO.getId());
		
		updatedRecept  = receptService.updateRecept(updatedRecept.getId(),updatedRecept);
		return new ResponseEntity<>(new ReceptDTO(updatedRecept), HttpStatus.OK);
		
	}
	
	//DELETE
	@RequestMapping(value="/recept/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteRecept(@PathVariable Long id) {
		
		Recept recept = receptService.findOne(id);
		if (recept != null) {
			receptService.deleteRecept(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
}