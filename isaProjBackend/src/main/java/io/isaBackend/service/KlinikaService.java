package io.isaBackend.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.repository.KlinikaRepository;


@Service
public class KlinikaService<Topic> {

	@Autowired
	private KlinikaRepository klinikaRepository;
	
	public List<Klinika> getAllKlinika(){
	List<Klinika> klinike = new ArrayList<>();
	 		klinikaRepository.findAll().forEach(klinike::add);
		return klinike;
	}
	
	public Klinika findOne(Long id) {
		return klinikaRepository.findById(id).orElseGet(null);
	}
	
	
	public Klinika addKlinika(Klinika klinika) throws Exception {
		  if (klinika.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        Klinika savedKlinika = klinikaRepository.save(klinika);
	        return savedKlinika;
		}	
	
	
	public Klinika updateKlinika(Long id, Klinika klinika)throws Exception{
		Optional<Klinika>  klinikaToUpdate =  klinikaRepository.findById(id);
		if (klinikaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Klinika updatedKlinika =  klinikaRepository.save(klinika);
		return updatedKlinika;
	}
	
	public void deleteKlinika(Long id) {
			klinikaRepository.deleteById(id);
	}

	public List<Klinika> getAllKlinikaByTipPregleda(String pregled_id) {
		return klinikaRepository.findAllByTipPregledaNaziv(pregled_id);
		 
	}
	
	public List<Klinika> findKlinikaByTipPregledaAndDatum(String tipPregleda, LocalDate datum) {
			
			return  klinikaRepository.findKlinikaByTipPregledaAndDatum(tipPregleda, datum);
		}
	
	public Klinika getKlinikaByDoktoriId(Long doktor_id) {
		// TODO Auto-generated method stub
		return  klinikaRepository.findKlinikaByDoktoriId(doktor_id);
	}
}
