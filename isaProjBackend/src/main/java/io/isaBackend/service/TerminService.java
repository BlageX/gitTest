package io.isaBackend.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.repository.TerminRepository;

@Service
public class TerminService {
	@Autowired
	private TerminRepository terminRepository;
	
	public List<Termin> getAllTermin(){
	List<Termin> termini = new ArrayList<>();
	 		terminRepository.findAll().forEach(termini::add);
		return termini;
	}
	
	//public Optional<Klinika> getKlinika(Long id) {
	//	return klinikaRepository.findById(id);
	//}
	
	public Termin findOne(Long id) {
		return terminRepository.findById(id).orElseGet(null);
	}

	public List<Termin> getAllTerminByDatum(LocalDate datum) {
		return terminRepository.getAllByDatum(datum);
	}

	public List<Klinika> findKlinikaByTipPregledaAndDatum(String tipPregleda, LocalDate datum) {
		
		return  terminRepository.findKlinikaByTipPregledaAndDatum(tipPregleda, datum);
	}
}