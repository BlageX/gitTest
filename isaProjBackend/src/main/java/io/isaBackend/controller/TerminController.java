package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.TerminDTO;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.service.TerminService;


import org.springframework.web.bind.annotation.RestController;


@RestController
public class TerminController {
	
	@Autowired 
	TerminService terminService;
	
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/termin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TerminDTO>> getAllTermin() {
	
		List<Termin> allTermin = terminService.getAllTermin();
		
		List<TerminDTO> terminDTO = new ArrayList<>();
		for (Termin t : allTermin) {
			terminDTO.add(new TerminDTO(t));
		}
		// convert doktor to DTOs
		return new ResponseEntity<>(terminDTO, HttpStatus.OK);

	}
		
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/termin/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<TerminDTO> getTermin(@PathVariable("id") Long id){
		
		Termin termin = terminService.findOne(id);
		
		if (termin == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new TerminDTO(termin), HttpStatus.OK);
		
	}
	
	
	//trebace put da promeni status sa true na false;
}
