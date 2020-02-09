package io.isaBackend.service;

import java.nio.file.AccessDeniedException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.Pacijent;
import io.isaBackend.repository.PacijentRepository;



@Service
public class PacijentService {

	@Autowired
	private PacijentRepository pacijentRepository;
	
	
	//vanila service//
	public List<Pacijent> getAllPacijent(){
		List<Pacijent> pacijenti = new ArrayList<>();
			pacijentRepository.findAll().forEach(pacijenti::add);
			return pacijenti;
		}
		
	public Pacijent findOne(Long id) {
		return pacijentRepository.findById(id).orElseGet(null);
	}
	
	
	public Pacijent addPacijent(Pacijent pacijent) throws Exception {
		  if (pacijent.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        Pacijent savedPacijent = pacijentRepository.save(pacijent);
	        return savedPacijent;
		}	
	
	
	public Pacijent updatePacijent(Long id, Pacijent pacijent)throws Exception{
		Optional<Pacijent>  pacijentToUpdate =  pacijentRepository.findById(id);
		if (pacijentToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Pacijent updatedPacijent =  pacijentRepository.save(pacijent);
		return updatedPacijent;
	}
	
		
	public void deletePacijent(Long id) {
		pacijentRepository.deleteById(id);
	}

}