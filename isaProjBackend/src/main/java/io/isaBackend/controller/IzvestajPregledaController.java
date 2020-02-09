package io.isaBackend.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.isaBackend.dto.IzvestajPregledaDTO;
import io.isaBackend.model.report.Dijagnoza;
import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.report.Recept;
import io.isaBackend.service.DijagnozaService;
import io.isaBackend.service.IzvestajPregledaService;
import io.isaBackend.service.PregledService;
import io.isaBackend.service.ReceptService;
import io.isaBackend.service.ZdravstveniKartonService;


@RestController
public class IzvestajPregledaController {

	@Autowired
	private IzvestajPregledaService izvestajPregledaService;
	
	@Autowired
	private DijagnozaService dijagnozaService;
	
	@Autowired
	private ReceptService receptService;
	
	@Autowired
	private ZdravstveniKartonService zdrKartonService;
	
	@Autowired
	private PregledService pregledService;
	
	//GET ALL	
	@RequestMapping(method=RequestMethod.GET, value="/izvestajPregleda", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<IzvestajPregledaDTO>> getAllIzvestajPregleda() {
	
		List<IzvestajPregleda> allIzvPregleda = izvestajPregledaService.getAllIzvestajPregleda();
		
		List<IzvestajPregledaDTO> izvPregledaDTO = new ArrayList<>();
		for (IzvestajPregleda ip : allIzvPregleda) {
			izvPregledaDTO.add(new IzvestajPregledaDTO(ip));
		}
		// convert adminClinic to DTOs
		return new ResponseEntity<>(izvPregledaDTO, HttpStatus.OK);

	}
	
	//GET
	@RequestMapping(method=RequestMethod.GET, value="/izvestajPregleda/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<IzvestajPregledaDTO> getIzvestajPregleda(@PathVariable("id") Long id){
		
		IzvestajPregleda izvPregleda =  izvestajPregledaService.findOne(id);
		if (izvPregleda == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(new IzvestajPregledaDTO(izvPregleda), HttpStatus.OK);
		
	}
	
	//POST
	//Ovo kaze metoda addTopic hendla svaki zahtev sa url '/topics' koji ima http zahtev POST:
	@RequestMapping(method=RequestMethod.POST, value="/izvestajPregleda",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<IzvestajPregledaDTO> addIzvestajPregleda(@RequestBody IzvestajPregledaDTO izvPregledaDTO) throws Exception {
		
		// a new exam must have student and course defined
		if (izvPregledaDTO.getDijagnoza() == null || izvPregledaDTO.getRecept() == null  /*|| izvPregledaDTO.getZdravstveniKarton() == null*/) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		Dijagnoza dijagnoza = dijagnozaService.findOne(izvPregledaDTO.getDijagnoza().getId());
		Recept recept = receptService.findOne(izvPregledaDTO.getRecept().getId());
		/*ZdravstveniKarton zdrKarton = zdrKartonService.findOne(izvPregledaDTO.getZdravstveniKarton().getId());*/
		
		
		
		if (dijagnoza == null || recept == null  /*|| zdrKarton == null*/) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		IzvestajPregleda savedIzvPregleda = new IzvestajPregleda();
		savedIzvPregleda.setId(izvPregledaDTO.getId());
		savedIzvPregleda.setOpisPregleda(izvPregledaDTO.getOpisPregleda());
		
		savedIzvPregleda.setDijagnoza(dijagnoza);
		savedIzvPregleda.setRecept(recept);
		/*savedIzvPregleda.setZdravstveniKarton(zdrKarton);*/
		
		savedIzvPregleda = izvestajPregledaService.addIzvestajPregleda(savedIzvPregleda);
		return new ResponseEntity<>(new IzvestajPregledaDTO(savedIzvPregleda), HttpStatus.CREATED);
	}

	//PUT
	@RequestMapping(method=RequestMethod.PUT, value="/izvestajPregleda", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<IzvestajPregledaDTO> updateIzvestajPregleda(@RequestBody IzvestajPregledaDTO izvPregledaDTO) throws Exception{
		
		IzvestajPregleda upadatedIzvPregleda =  izvestajPregledaService.findOne(izvPregledaDTO.getId());
		
		if (upadatedIzvPregleda == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// we allow changing date and points for an izvestajPregleda only
		upadatedIzvPregleda.setId(izvPregledaDTO.getId());
		upadatedIzvPregleda.setOpisPregleda(izvPregledaDTO.getOpisPregleda());

		upadatedIzvPregleda = izvestajPregledaService.updateIzvestajPregleda(upadatedIzvPregleda.getId(), upadatedIzvPregleda);
		return new ResponseEntity<>(new IzvestajPregledaDTO(upadatedIzvPregleda), HttpStatus.OK);
	}

	
	//DELET	
	@RequestMapping(value="/izvestajPregleda/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Void> deleteKlinika(@PathVariable Long id) {
		
		IzvestajPregleda izvPregleda =  izvestajPregledaService.findOne(id);
		if (izvPregleda != null) {
			izvestajPregledaService.deleteIzvestajPregleda(id);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} else {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
	}
	
}
