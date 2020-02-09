package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.repository.PregledRepository;


@Service
public class PregledService {
	
	@Autowired
	private PregledRepository pregledRepository;
	
	public List<Pregled> getAllPregled(){
		List<Pregled> pregledi = new ArrayList<>();
			pregledRepository.findAll().forEach(pregledi::add);
			return pregledi;
		}
		
//		public Optional<Pregled> getPregled(Long id) {
//			return pregledRepository.findById(id);
//		}
		
	public Pregled findOne(Long id) {
		return pregledRepository.findById(id).orElseGet(null);
	}
	
	
	public Pregled addPregled(Pregled pregled) throws Exception {
		  if (pregled.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        Pregled savedPregled =	pregledRepository.save(pregled);
	        return savedPregled;
		}	
	
	
	public Pregled updatePregled(Long id, Pregled pregled)throws Exception{
		Optional<Pregled>  pregledToUpdate =  pregledRepository.findById(id);
		if (pregledToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Pregled updatedPregled =  pregledRepository.save(pregled);
		return updatedPregled;
	}
	
	public void deletePregled(Long id) {
		pregledRepository.deleteById(id);
	}
	
	//DODATO
	public List<Pregled> getAllByKlinikaId(Long id) {
			return pregledRepository.findAllByKlinikaId(id);
	}
	
	public List<Pregled> getAllByPacijentId(Long pacijent_id) {
		return pregledRepository.findAllByPacijentId(pacijent_id);
	}
	
}
