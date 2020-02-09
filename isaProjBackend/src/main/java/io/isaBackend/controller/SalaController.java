package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

import io.isaBackend.dto.KlinikaDTO;
import io.isaBackend.dto.SalaDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Sala;
import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.service.KlinikaService;
import io.isaBackend.service.SalaService;

@RestController
public class SalaController {
	
	@Autowired
	private SalaService salaService;
	
	//GET ALL
	@RequestMapping(value="/sala", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<SalaDTO>> getAllSala() {
		List<Sala> sale = salaService.getAllSala();
		
		List<SalaDTO> salaDTO = new ArrayList<>();
		for (Sala s : sale) {
			salaDTO.add(new SalaDTO(s));
		}
		// convert sala to DTOs
		return new ResponseEntity<>(salaDTO, HttpStatus.OK);
		
	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/sala/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SalaDTO> getSala(@PathVariable("id") Long id){
		
		Sala sala = salaService.findOne(id);
		if (sala == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new SalaDTO(sala), HttpStatus.OK);
		
	}

	//POST
	@RequestMapping(method=RequestMethod.POST, value="/sala",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SalaDTO> addSala(@RequestBody SalaDTO salaDTO) throws Exception {
		
		Sala savedSala = new Sala();
		savedSala.setId(salaDTO.getId());
		savedSala.setNaziv(salaDTO.getNaziv());
		savedSala.setBroj(salaDTO.getBroj());
		savedSala.setRezervisana(salaDTO.isRezervisana());
		
		savedSala = salaService.addSala(savedSala);
		return new ResponseEntity<>(new SalaDTO(savedSala), HttpStatus.CREATED);
	}

	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/sala", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SalaDTO> updateSala(@RequestBody SalaDTO salaDTO) throws Exception{
		
		Sala updatedSala = salaService.findOne(salaDTO.getId());
		
		if (updatedSala == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an sala only
		updatedSala.setId(salaDTO.getId());
		updatedSala.setNaziv(salaDTO.getNaziv());
		updatedSala.setBroj(salaDTO.getBroj());
		updatedSala.setRezervisana(salaDTO.isRezervisana());

		updatedSala  = salaService.updateSala(updatedSala.getId(),updatedSala);
		return new ResponseEntity<>(new SalaDTO(updatedSala), HttpStatus.OK);
	}
	
	//DELETE
	@RequestMapping(value="/sala/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteSala(@PathVariable Long id) {
		
		Sala sala = salaService.findOne(id);
		if (sala != null) {
			salaService.deleteSala(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
	//GET ALL SALA By Klinika ID
	@PreAuthorize("hasRole('PACIJENT')")
	@RequestMapping(value="/klinika/{id}/getSale", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<SalaDTO>> getAllSalaByKlinikaId(@PathVariable("id") Long id) {
		List<Sala> sale = salaService.getAllSalaByKlinikaId(id);
		
		List<SalaDTO> salaDTO = new ArrayList<>();
		for (Sala s : sale) {
			salaDTO.add(new SalaDTO(s));
		}
		// convert sala to DTOs
		return new ResponseEntity<>(salaDTO, HttpStatus.OK);
	}
	
}