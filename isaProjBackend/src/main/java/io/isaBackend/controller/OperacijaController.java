package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
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

import io.isaBackend.dto.DoktorDTO;
import io.isaBackend.dto.LekDTO;
import io.isaBackend.dto.OperacijaDTO;
import io.isaBackend.dto.PredefPregledDTO;
import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.klinika.Sala;
import io.isaBackend.model.klinika.TipPregleda;
import io.isaBackend.model.report.Lek;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.Pacijent;
import io.isaBackend.service.DoktorService;
import io.isaBackend.service.OperacijaService;
import io.isaBackend.service.PacijentService;
import io.isaBackend.service.SalaService;


@RestController
public class OperacijaController {
	
	@Autowired
	private OperacijaService operacijaService;
	
	@Autowired
	private SalaService salaService;
	
	@Autowired
	private DoktorService doktorService;
	
	@Autowired
	private PacijentService pacijentService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/operacija", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<OperacijaDTO>> getAllOperacija() {
	
		List<Operacija> allOperacija = operacijaService.getAllOperacija();
		
		List<OperacijaDTO> operacijaDTO = new ArrayList<>();
		for (Operacija o : allOperacija) {
			operacijaDTO.add(new OperacijaDTO(o));
		}
		// convert operaicaj to DTOs
		return new ResponseEntity<>(operacijaDTO, HttpStatus.OK);
	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/operacija/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OperacijaDTO> getOperacija(@PathVariable("id") Long id){
		
		Operacija operacija =  operacijaService.findOne(id);
	
		if (operacija  == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new OperacijaDTO(operacija), HttpStatus.OK);
	}
	
	//POST
	@RequestMapping(method=RequestMethod.POST, value="/operacija",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OperacijaDTO> addOperacija(@RequestBody OperacijaDTO operacijaDTO) throws Exception {
		
		// a new operacija must have sala, doktori and pacijent defined
		if (operacijaDTO.getSala() == null  || operacijaDTO.getDoktori() == null || operacijaDTO.getPacijent() == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		Pacijent pacijent = pacijentService.findOne(operacijaDTO.getPacijent().getId());
		Sala sala = salaService.findOne(operacijaDTO.getSala().getId());
		
		
		Set<DoktorDTO> doktoriDTO = operacijaDTO.getDoktori();		
		Set<Doktor> doktori = new HashSet<Doktor>();
		
		//prebacivanje iz DTO u model
		for(DoktorDTO d : doktoriDTO) {
			doktori.add(doktorService.findOne(d.getId()));
		}
		
	
	
		if (sala == null  || pacijent == null || doktori == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		Operacija savedOperacija = new Operacija();
		savedOperacija.setId(operacijaDTO.getId());
		savedOperacija.setDatum(operacijaDTO.getDatum()); 
		savedOperacija.setVreme(operacijaDTO.getVreme());
		savedOperacija.setTrajanje(operacijaDTO.getTrajanje());
		
		savedOperacija.setSala(sala);
		savedOperacija.setPacijent(pacijent);
		savedOperacija.setDoktori(doktori);
		
		savedOperacija = operacijaService.addOperacija(savedOperacija);
		return new ResponseEntity<>(new OperacijaDTO(savedOperacija), HttpStatus.CREATED);
	}

	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/operacija", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OperacijaDTO> updateOperacija(@RequestBody OperacijaDTO operacijaDTO) throws Exception{
		
		Operacija updatedOperacija =  operacijaService.findOne(operacijaDTO.getId());
		
		if (updatedOperacija == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an operacija only
		updatedOperacija.setId(operacijaDTO.getId());
		updatedOperacija.setDatum(operacijaDTO.getDatum()); 
		updatedOperacija.setVreme(operacijaDTO.getVreme());
		updatedOperacija.setTrajanje(operacijaDTO.getTrajanje());

		updatedOperacija = operacijaService.updateOperacija(updatedOperacija.getId(), updatedOperacija);
		return new ResponseEntity<>(new OperacijaDTO(updatedOperacija), HttpStatus.OK);
	}

	
	//DELET	
	@RequestMapping(value="/operacija/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteOperacija(@PathVariable Long id) {
		
		Operacija predefOperacija =  operacijaService.findOne(id);
		if (predefOperacija != null) {
			operacijaService.deleteOperacija(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}

}
