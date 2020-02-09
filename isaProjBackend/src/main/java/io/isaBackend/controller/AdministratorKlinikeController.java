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

import io.isaBackend.dto.AdministratorKlinikeDTO;
import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.service.AdministratorKlinikeService;
import io.isaBackend.service.KlinikaService;

@RestController
public class AdministratorKlinikeController {

	@Autowired
	private AdministratorKlinikeService adminKlinikeService;
	
	@Autowired
	private KlinikaService klinikaService;
	
		
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/administratorKlinike", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AdministratorKlinikeDTO>> getAllAdministratorKlinike() {
	
		List<AdministratorKlinike> allAdminKlinke = adminKlinikeService.getAllAdministratorKlinike();
		
		List<AdministratorKlinikeDTO> adminKlinikeDTO = new ArrayList<>();
		for (AdministratorKlinike admin : allAdminKlinke) {
			adminKlinikeDTO.add(new AdministratorKlinikeDTO(admin));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(adminKlinikeDTO, HttpStatus.OK);

	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/administratorKlinike/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdministratorKlinikeDTO> getAdministratorKlinike(@PathVariable("id") Long id){
		
		AdministratorKlinike adminKlinike = adminKlinikeService.findOne(id);
		//return radnikService.getRadnik(id);
		if (adminKlinike == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new AdministratorKlinikeDTO(adminKlinike), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/administratorKlinike",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdministratorKlinikeDTO> addAdministratorKlinike(@RequestBody AdministratorKlinikeDTO adminKlinikeDTO)  throws Exception {
		
		// a new exam must have student and course defined
		if (adminKlinikeDTO.getKlinika() == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		Klinika klinika = klinikaService.findOne(adminKlinikeDTO.getKlinika().getId());
	
		if (klinika == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}		
		
		AdministratorKlinike savedAdminiKlinike = new AdministratorKlinike();
		savedAdminiKlinike.setId(adminKlinikeDTO.getId());
		savedAdminiKlinike.setIme(adminKlinikeDTO.getIme());
		savedAdminiKlinike.setPrezime(adminKlinikeDTO.getPrezime());
		
		savedAdminiKlinike.setKlinika(klinika);
		
		savedAdminiKlinike = adminKlinikeService.addAdministratorKlinike(savedAdminiKlinike);
		return new ResponseEntity<>(new AdministratorKlinikeDTO(savedAdminiKlinike), HttpStatus.CREATED);
	}
	
	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/administratorKlinike", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdministratorKlinikeDTO> updateAdministratorKlinike(@RequestBody AdministratorKlinikeDTO adminKlinikeDTO) throws Exception{
		
		AdministratorKlinike updatedAdminKlinike = adminKlinikeService.findOne(adminKlinikeDTO.getId());
		
		if (updatedAdminKlinike == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an radnik only
		updatedAdminKlinike.setId(adminKlinikeDTO.getId());
		updatedAdminKlinike.setIme(adminKlinikeDTO.getIme());
		updatedAdminKlinike.setPrezime(adminKlinikeDTO.getPrezime());
		

		updatedAdminKlinike  = adminKlinikeService.updateAdministratorKlinike(updatedAdminKlinike.getId(),updatedAdminKlinike);
		return new ResponseEntity<>(new AdministratorKlinikeDTO(updatedAdminKlinike), HttpStatus.OK);
	}
	
	//DELET	
	@RequestMapping(value="/administratorKlinike/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteAdministratorKlinike(@PathVariable Long id) {
		
		AdministratorKlinike adminKlinike = adminKlinikeService.findOne(id);
		if (adminKlinike != null) {
			adminKlinikeService.deleteAdministratorKlinike(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
}