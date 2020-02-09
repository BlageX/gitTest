package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.Lek;
import io.isaBackend.repository.LekRepository;


@Service
public class LekService {
	
	@Autowired
	private LekRepository lekRepository;
	
	public List<Lek> getAllLek(){
		List<Lek> lekovi = new ArrayList<>();
			lekRepository.findAll().forEach(lekovi::add);
			return lekovi;
		}
		
//		public Optional<Lek> getLek(Long id) {
//		return lekRepository.findById(id);
//		}
		
	public Lek findOne(Long id) {
		return lekRepository.findById(id).orElseGet(null);
	}
	
	
	public Lek addLek(Lek lek) throws Exception {
	  if (lek.getId() != null) {
            throw new Exception(
                    "Id mora biti null prilikom perzistencije novog entiteta.");
        }
        Lek savedLek = lekRepository.save(lek);
        return savedLek;
	}	
	
	
	public Lek updateLek(Long id, Lek lek)throws Exception{
		Optional<Lek>  lekToUpdate =  lekRepository.findById(id);
		if (lekToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Lek updatedLek =  lekRepository.save(lek);
		return updatedLek;
	}
	
	
	public void deleteLek(Long id) {
		lekRepository.deleteById(id);
	}

}
