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

import io.isaBackend.dto.LekDTO;
import io.isaBackend.model.report.Lek;
import io.isaBackend.service.LekService;



@RestController
public class LekController {

	@Autowired
	private LekService lekService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/lek", produces = MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<LekDTO>> getAllLek() {
	
		List<Lek> allLek = lekService.getAllLek();
		
		List<LekDTO> lekDTO = new ArrayList<>();
		for (Lek l : allLek) {
			lekDTO.add(new LekDTO(l));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(lekDTO, HttpStatus.OK);

	}
	
		//GET
		@RequestMapping(method=RequestMethod.GET, value="/lek/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
		@PreAuthorize("hasRole('PACIJENT')")
		public ResponseEntity<LekDTO> getLek(@PathVariable("id") Long id){
			
			Lek lek = lekService.findOne(id);
			//return radnikService.getRadnik(id);
			if (lek == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(new LekDTO(lek), HttpStatus.OK);
			
		}
		
		//POST
		//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
		@RequestMapping(method=RequestMethod.POST, value="/lek",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<LekDTO> addLek(@RequestBody LekDTO lekDTO)  throws Exception {
			Lek savedLek = new Lek();
			savedLek.setId(lekDTO.getId());
			savedLek.setNaziv(lekDTO.getNaziv());			
			
			savedLek = lekService.addLek(savedLek);
			return new ResponseEntity<>(new LekDTO(savedLek), HttpStatus.CREATED);
		}
		
		//PUT
		@RequestMapping(method=RequestMethod.PUT, value="/lek", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<LekDTO> updateLek(@RequestBody LekDTO lekDTO) throws Exception{
			
			Lek updatedLek= lekService.findOne(lekDTO.getId());
			
			if (updatedLek == null) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			// we allow changing date and points for an radnik only
			updatedLek.setId(lekDTO.getId());
			updatedLek.setNaziv(lekDTO.getNaziv());

			updatedLek  = lekService.updateLek(updatedLek.getId(),updatedLek);
			return new ResponseEntity<>(new LekDTO(updatedLek), HttpStatus.OK);
		}

		
		//DELET	
		@RequestMapping(value="/lek/{id}", method=RequestMethod.DELETE)
		public ResponseEntity<Void> deleteLek(@PathVariable Long id) {
			
			Lek lek = lekService.findOne(id);
			if (lek != null) {
				lekService.deleteLek(id);
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			} 
		}
	
}
