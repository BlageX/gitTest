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

import io.isaBackend.dto.AdministratorKlinikeDTO;
import io.isaBackend.dto.MedicinskaSestraDTO;
import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.model.user.MedicinskaSestra;
import io.isaBackend.service.MedicinskaSestraService;

@RestController
//@RequestMapping(value = "api/patients")
public class MedicinskaSestraController {

	@Autowired
	private MedicinskaSestraService medSestraService;
	
	//GET ALL	
		@RequestMapping(method=RequestMethod.GET, value="/medicinskaSestra", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<MedicinskaSestraDTO>> getAllMedicinskaSestra() {
		
			List<MedicinskaSestra> allMedSestra  =  medSestraService.getAllMedicinskaSestra();
			
			List<MedicinskaSestraDTO> medicnskaSestraDTO = new ArrayList<>();
			for (MedicinskaSestra ms : allMedSestra) {
				medicnskaSestraDTO.add(new MedicinskaSestraDTO(ms));
			}
			// convert adminClinic to DTOs
			return new ResponseEntity<>(medicnskaSestraDTO, HttpStatus.OK);

		}
		
		//GET
		@RequestMapping(method=RequestMethod.GET, value="/medicinskaSestra/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<MedicinskaSestraDTO> getMedicinskaSestra(@PathVariable("id") Long id){
			
			MedicinskaSestra medSestra = medSestraService.findOne(id);
			//return radnikService.getRadnik(id);
			if (medSestra == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(new MedicinskaSestraDTO(medSestra), HttpStatus.OK);
			
		}
		
		//POST
		//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
		@RequestMapping(method=RequestMethod.POST, value="/medicinskaSestra",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<MedicinskaSestraDTO> addMedicinskaSestra(@RequestBody MedicinskaSestraDTO medSestraDTO)  throws Exception {
		
			MedicinskaSestra savedMedSestra = new MedicinskaSestra();
			savedMedSestra.setId(medSestraDTO.getId());
			savedMedSestra.setIme(medSestraDTO.getIme());
			savedMedSestra.setPrezime(medSestraDTO.getPrezime());
			
			savedMedSestra = medSestraService.addMedicinskaSestra(savedMedSestra);
			return new ResponseEntity<>(new MedicinskaSestraDTO(savedMedSestra), HttpStatus.CREATED);
		}
		
		//PUT
		@RequestMapping(method=RequestMethod.PUT, value="/medicinskaSestra", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<MedicinskaSestraDTO> updateMedicinskaSestra(@RequestBody MedicinskaSestraDTO medSestraDTO) throws Exception{
			
			MedicinskaSestra updatedMedSestra = medSestraService.findOne(medSestraDTO.getId());
			
			if (updatedMedSestra == null) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			// we allow changing date and points for an radnik only
			updatedMedSestra.setId(medSestraDTO.getId());
			updatedMedSestra.setIme(medSestraDTO.getIme());
			updatedMedSestra.setPrezime(medSestraDTO.getPrezime());
			

			updatedMedSestra  = medSestraService.updateMedicinskaSestra(updatedMedSestra.getId(),updatedMedSestra);
			return new ResponseEntity<>(new MedicinskaSestraDTO(updatedMedSestra), HttpStatus.OK);
		}

		//DELET	
		@RequestMapping(value="/medicinskaSestra/{id}", method=RequestMethod.DELETE)
		public ResponseEntity<Void> deleteMedicinskaSestra(@PathVariable Long id) {
			
			MedicinskaSestra medSestra = medSestraService.findOne(id);
			if (medSestra != null) {
				medSestraService.deleteMedicinskaSestra(id);
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			} 
		}
	
}
