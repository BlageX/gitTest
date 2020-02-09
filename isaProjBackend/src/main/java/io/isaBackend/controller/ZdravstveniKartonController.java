package io.isaBackend.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.KlinikaDTO;
import io.isaBackend.dto.ZdravstveniKartonDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.ZdravstveniKarton;
import io.isaBackend.service.ZdravstveniKartonService;

@RestController
public class ZdravstveniKartonController {

	@Autowired
	private ZdravstveniKartonService zdravstveniKartonService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/zdravstveniKarton", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ZdravstveniKartonDTO>> getAllZdravstveniKarton() {
	
		List<ZdravstveniKarton> allZdravstveniKarton = zdravstveniKartonService.getAllZdravstveniKarton();
		
		List<ZdravstveniKartonDTO> zdravstveniKartonDTO = new ArrayList<>();
		for (ZdravstveniKarton zk : allZdravstveniKarton) {
			zdravstveniKartonDTO.add(new ZdravstveniKartonDTO(zk));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(zdravstveniKartonDTO, HttpStatus.OK);

	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/zdravstveniKarton/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ZdravstveniKartonDTO> getZdravstveniKarton(@PathVariable("id") Long id){
		
		ZdravstveniKarton zdravstveniKarton = zdravstveniKartonService.findOne(id);
		//return radnikService.getRadnik(id);
		if (zdravstveniKarton == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new ZdravstveniKartonDTO(zdravstveniKarton), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/zdravstveniKarton",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ZdravstveniKartonDTO> addZdravstveniKarton(@RequestBody ZdravstveniKartonDTO zdrKartonDTO)  throws Exception {
		ZdravstveniKarton savedZdrKarton = new ZdravstveniKarton();
		savedZdrKarton.setId(zdrKartonDTO.getId());
		savedZdrKarton.setVisina(zdrKartonDTO.getVisina());
		savedZdrKarton.setTezina(zdrKartonDTO.getTezina());
		savedZdrKarton.setKrvnaGrupa(zdrKartonDTO.getKrvnaGrupa());
		savedZdrKarton.setAlergija(zdrKartonDTO.getAlergija());
		savedZdrKarton.setDioptrija(zdrKartonDTO.getDioptrija());
		
		
		savedZdrKarton = zdravstveniKartonService.addZdravstveniKarton(savedZdrKarton);
		return new ResponseEntity<>(new ZdravstveniKartonDTO(savedZdrKarton), HttpStatus.CREATED);
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/zdravstveniKarton", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ZdravstveniKartonDTO> updateZdravstveniKarton(@RequestBody ZdravstveniKartonDTO zdrKartonDTO) throws Exception{
		
		ZdravstveniKarton updatedZdrKarton = zdravstveniKartonService.findOne(zdrKartonDTO.getId());
		
		if (updatedZdrKarton == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an zdravstveniKarton only
		updatedZdrKarton.setId(zdrKartonDTO.getId());
		updatedZdrKarton.setVisina(zdrKartonDTO.getVisina());
		updatedZdrKarton.setTezina(zdrKartonDTO.getTezina());
		updatedZdrKarton.setKrvnaGrupa(zdrKartonDTO.getKrvnaGrupa());
		updatedZdrKarton.setAlergija(zdrKartonDTO.getAlergija());
		updatedZdrKarton.setDioptrija(zdrKartonDTO.getDioptrija());
		

		updatedZdrKarton  = zdravstveniKartonService.updateZdravstveniKarton(updatedZdrKarton.getId(),updatedZdrKarton);
		return new ResponseEntity<>(new ZdravstveniKartonDTO(updatedZdrKarton), HttpStatus.OK);
	}

	
	//DELET	
	@RequestMapping(value="/zdravstveniKarton/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteZdravstveniKarton(@PathVariable Long id) {
		
		ZdravstveniKarton zdrKarton = zdravstveniKartonService.findOne(id);
		if (zdrKarton != null) {
			zdravstveniKartonService.deleteZdravstveniKarton(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
}
