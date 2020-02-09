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

import io.isaBackend.dto.DijagnozaDTO;
import io.isaBackend.dto.KlinikaDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.Dijagnoza;
import io.isaBackend.service.DijagnozaService;



@RestController
public class DijagnozaController {
		
	@Autowired
	private DijagnozaService dijagnozaService;
	
	
	//GET ALL	
			@RequestMapping(method=RequestMethod.GET, value="/dijagnoza", produces = MediaType.APPLICATION_JSON_VALUE)
			public ResponseEntity<List<DijagnozaDTO>> getAllDijagnoza() {
			
				List<Dijagnoza> allDijagnoza  = dijagnozaService.getAllDijagnoza();
				
				List<DijagnozaDTO> dijagnozaDTO = new ArrayList<>();
				for (Dijagnoza d : allDijagnoza) {
					dijagnozaDTO.add(new DijagnozaDTO(d));
				}
				// convert dijagoza to DTOs
				return new ResponseEntity<>(dijagnozaDTO, HttpStatus.OK);

			}
			
			//GET
			@RequestMapping(method=RequestMethod.GET, value="/dijagnoza/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
			public ResponseEntity<DijagnozaDTO> getDijagnoza(@PathVariable("id") Long id){
				
				Dijagnoza dijagnoza = dijagnozaService.findOne(id);
			
				if (dijagnoza == null) {
					return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				}
				return new ResponseEntity<>(new DijagnozaDTO(dijagnoza), HttpStatus.OK);
				
			}
			
			//POST
			//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
			@RequestMapping(method=RequestMethod.POST, value="/dijagnoza",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
			public ResponseEntity<DijagnozaDTO> addDijagnoza(@RequestBody DijagnozaDTO dijagnozaDTO)  throws Exception {
				Dijagnoza savedDijagnoza = new Dijagnoza();
				savedDijagnoza.setId(dijagnozaDTO.getId());
				savedDijagnoza.setNaziv(dijagnozaDTO.getNaziv());

				savedDijagnoza = dijagnozaService.addDijagnoza(savedDijagnoza);
				return new ResponseEntity<>(new DijagnozaDTO(savedDijagnoza), HttpStatus.CREATED);
			}
			
			//PUT
			@RequestMapping(method=RequestMethod.PUT, value="/dijagnoza", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
			public ResponseEntity<DijagnozaDTO> updateDijagnoza(@RequestBody DijagnozaDTO dijagnozaDTO) throws Exception{
				
				Dijagnoza updatedDijagnoza = dijagnozaService.findOne(dijagnozaDTO.getId());
				
				if (updatedDijagnoza == null) {
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				
				// we allow changing date and points for an radnik only
				updatedDijagnoza.setId(dijagnozaDTO.getId());
				updatedDijagnoza.setNaziv(dijagnozaDTO.getNaziv());

				updatedDijagnoza = dijagnozaService.updateDijagnoza(updatedDijagnoza.getId(),updatedDijagnoza);
				return new ResponseEntity<>(new DijagnozaDTO(updatedDijagnoza), HttpStatus.OK);
			}

			
			//DELET	
			@RequestMapping(value="/dijagnoza/{id}", method=RequestMethod.DELETE)
			public ResponseEntity<Void> deleteDijagnoza(@PathVariable Long id) {
				
				Dijagnoza dijagnoza = dijagnozaService.findOne(id);
				if (dijagnoza != null) {
					dijagnozaService.deleteDijagnoza(id);
					return new ResponseEntity<>(HttpStatus.NO_CONTENT);
				} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				} 
			}

	
}
