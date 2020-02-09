package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Sala;
import io.isaBackend.repository.SalaRepository;


@Service
public class SalaService {

	@Autowired
	private SalaRepository salaRepository;
	
	public List<Sala> getAllSala(){
		List<Sala> salas = new ArrayList<>();
			salaRepository.findAll().forEach(salas::add);
			return salas;
		}
		
//		public Optional<Sala> getSala(Long id) {
//			return salaRepository.findById(id);
//		}
		
	public Sala findOne(Long id) {
		return salaRepository.findById(id).orElseGet(null);
	}
	
	
	public Sala addSala(Sala sala) throws Exception {
		  if (sala.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        Sala savedSala = salaRepository.save(sala);
	        return savedSala;
		}	
	
	
	public Sala updateSala(Long id, Sala sala)throws Exception{
		Optional<Sala>  salaToUpdate =  salaRepository.findById(id);
		if (salaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Sala updatedSala =  salaRepository.save(sala);
		return updatedSala;
	}
	
		
	public void deleteSala(Long id) {
		salaRepository.deleteById(id);
	}
	
	public List<Sala> getAllSalaByKlinikaId(Long klinika_id){
		return salaRepository.findAllByKlinikaId(klinika_id);
	}
	
}
