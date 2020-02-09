package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.AdministratorKlinickogCentraDTO;
import io.isaBackend.model.user.AdministratorKlinickogCentra;
import io.isaBackend.service.AdministratorKlinickogCentraService;

@RestController
public class AdministratorKlinickogCentraController {

	@Autowired
	private AdministratorKlinickogCentraService adminKlinCentraService;
	
		
	//GET ALL	
		@RequestMapping(method=RequestMethod.GET, value="/AdministratorKlinickogCentra", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<AdministratorKlinickogCentraDTO>> getAllAdministratorKlinickogCentra() {
		
			List<AdministratorKlinickogCentra> allAdminKlinCentra = adminKlinCentraService.getAllAdministratorKlinickogCentra();
			
			List<AdministratorKlinickogCentraDTO> adminKlinCentraDTO = new ArrayList<>();
			for (AdministratorKlinickogCentra akc : allAdminKlinCentra) {
				adminKlinCentraDTO.add(new AdministratorKlinickogCentraDTO(akc));
			}
			// convert adminClinic to DTOs
			return new ResponseEntity<>(adminKlinCentraDTO, HttpStatus.OK);

		}
		
		//GET
		@RequestMapping(method=RequestMethod.GET, value="/AdministratorKlinickogCentra/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<AdministratorKlinickogCentraDTO> getAdministratorKlinickogCentra(@PathVariable("id") Long id){
			
			AdministratorKlinickogCentra adminKlinCentra = adminKlinCentraService.findOne(id);
			//return radnikService.getRadnik(id);
			if (adminKlinCentra == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(new AdministratorKlinickogCentraDTO(adminKlinCentra), HttpStatus.OK);
			
		}
		
		//POST
		//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
		@RequestMapping(method=RequestMethod.POST, value="/AdministratorKlinickogCentra",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<AdministratorKlinickogCentraDTO> addAdministratorKlinickogCentra(@RequestBody AdministratorKlinickogCentraDTO adminKlinCentraDTO)  throws Exception {
			AdministratorKlinickogCentra savedAdminKlinCentra = new AdministratorKlinickogCentra();
			savedAdminKlinCentra.setId(adminKlinCentraDTO.getId());

			
			savedAdminKlinCentra  = adminKlinCentraService.addAdministratorKlinickogCentra(savedAdminKlinCentra );
			return new ResponseEntity<>(new AdministratorKlinickogCentraDTO(savedAdminKlinCentra ), HttpStatus.CREATED);
		}
		
		//PUT
		@RequestMapping(method=RequestMethod.PUT, value="/AdministratorKlinickogCentra", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<AdministratorKlinickogCentraDTO> updateAdministratorKlinickogCentra(@RequestBody AdministratorKlinickogCentraDTO adminKlinCentraDTO) throws Exception{
			
			AdministratorKlinickogCentra updatedAdminKlinCentra = adminKlinCentraService.findOne(adminKlinCentraDTO.getId());
			
			if (updatedAdminKlinCentra == null) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			// we allow changing date and points for an klinika only
			updatedAdminKlinCentra.setId(adminKlinCentraDTO.getId());			

			updatedAdminKlinCentra = adminKlinCentraService.updateAdministratorKlinickogCentra(updatedAdminKlinCentra.getId(), updatedAdminKlinCentra);
			return new ResponseEntity<>(new AdministratorKlinickogCentraDTO(updatedAdminKlinCentra), HttpStatus.OK);
		}

		
		//DELET	
		@RequestMapping(value="/AdministratorKlinickogCentra/{id}", method=RequestMethod.DELETE)
		public ResponseEntity<Void> deleteAdministratorKlinickogCentra(@PathVariable Long id) {
			
			AdministratorKlinickogCentra adminKlinCentra = adminKlinCentraService.findOne(id);
			if (adminKlinCentra != null) {
				adminKlinCentraService.deleteAdministratorKlinickogCentra(id);
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			} 
		}
		
		
}
