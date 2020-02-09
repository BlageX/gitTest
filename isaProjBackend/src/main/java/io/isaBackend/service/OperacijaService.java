package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.repository.OperacijaRepository;

@Service
public class OperacijaService {

	@Autowired
	private OperacijaRepository operacijaRepository;
	
	public List<Operacija> getAllOperacija(){
		List<Operacija> operacije = new ArrayList<>();
			operacijaRepository.findAll().forEach(operacije::add);
			return operacije;
		}
		
//		public Optional<Operacija> getOperacija(Long id) {
//		return operacijaRepository.findById(id);
//		}
		
	public Operacija findOne(Long id) {
		return operacijaRepository.findById(id).orElseGet(null);
	}
	
	
	public Set<Doktor> findAllDoktorByOperacijaId(Long operacija_id) throws Exception{
		Set<Doktor> doktori = operacijaRepository.findByDoktoriId(operacija_id);
		if (doktori == null) {
	           throw new Exception("Trazeni entiteti nisu pronadjeni.");
	    }
		return doktori;
	}
	
	
	public Operacija addOperacija(Operacija operacija) throws Exception {
		  if (operacija.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        Operacija savedOperacija = operacijaRepository.save(operacija);
	        return savedOperacija;
		}	
	
	
	public Operacija updateOperacija(Long id, Operacija operacija)throws Exception{
		Optional<Operacija>  operacijaToUpdate =  operacijaRepository.findById(id);
		if (operacijaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Operacija updatedOperacija =  operacijaRepository.save(operacija);
		return updatedOperacija;
	}
		
		public void deleteOperacija(Long id) {
			operacijaRepository.deleteById(id);
		}
}
