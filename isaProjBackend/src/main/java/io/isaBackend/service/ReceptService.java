package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.report.Recept;
import io.isaBackend.repository.ReceptRepository;


@Service
public class ReceptService {
	
	@Autowired
	private ReceptRepository receptRepository;
	
	public List<Recept> getAllRecept(){
		List<Recept> recepti = new ArrayList<>();
			receptRepository.findAll().forEach(recepti::add);
			return recepti;
		}
		
		
	public Recept findOne(Long id) {
		return receptRepository.findById(id).orElseGet(null);
	}
	
	public Recept addRecept(Recept recept) throws Exception {
	  if (recept.getId() != null) {
            throw new Exception(
                    "Id mora biti null prilikom perzistencije novog entiteta.");
        }
        Recept savedRecept = receptRepository.save(recept);
        return savedRecept;
	}	
	
	
	public Recept updateRecept(Long id, Recept recept)throws Exception{
		Optional<Recept> receptToUpdate = receptRepository.findById(id);
		if (receptToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Recept updatedRecept = receptRepository.save(recept);
		return updatedRecept;
	}
		
		public void deleteRecept(Long id) {
			receptRepository.deleteById(id);
		}
}
