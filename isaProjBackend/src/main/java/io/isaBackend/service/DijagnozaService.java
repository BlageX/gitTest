package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.report.Dijagnoza;
import io.isaBackend.repository.DijagnozaRepository;

@Service
public class DijagnozaService {

	@Autowired
	private DijagnozaRepository dijagnozaRepository;
	
	public List<Dijagnoza> getAllDijagnoza(){
		List<Dijagnoza> dijagnoze = new ArrayList<>();
			dijagnozaRepository.findAll().forEach(dijagnoze::add);
			return dijagnoze;
		}
		
	
	public Dijagnoza findOne(Long id) {
		return dijagnozaRepository.findById(id).orElseGet(null);
	}
	
	public Dijagnoza addDijagnoza(Dijagnoza dijagnoza) throws Exception {
		  if (dijagnoza.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	       	Dijagnoza savedDijagnoza = dijagnozaRepository.save(dijagnoza);
	        return savedDijagnoza;
		}	
	
	
	public Dijagnoza updateDijagnoza(Long id, Dijagnoza dijagnoza)throws Exception{
		Optional<Dijagnoza>  dijagnozaToUpdate =  dijagnozaRepository.findById(id);
		if (dijagnozaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Dijagnoza updatedDijagnoza = dijagnozaRepository.save(dijagnoza);
		return updatedDijagnoza;
	}
	

	public void deleteDijagnoza(Long id) {
		dijagnozaRepository.deleteById(id);
	}
	
}
