package io.isaBackend.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.repository.DoktorRepository;

@Service
public class DoktorService<T> {

	@Autowired
	private DoktorRepository doktorRepository;
	
	public List<Doktor> getAllDoktor(){
		List<Doktor> doktori = new ArrayList<>();
		 	doktorRepository.findAll().forEach(doktori::add);
			return doktori;
		}
		
//		public Optional<Doktor> getDoktor(Long id) {
//			return doktorRepository.findById(id);
//		}
	
	//rucno dodati--

	public List<Doktor> findAllDoktorByOperacijaId(Long operacija_id) throws Exception{
		List<Doktor> doktori = doktorRepository.findAllByOperacijaId(operacija_id);
		if (doktori == null) {
	           throw new Exception("Trazeni entiteti nisu pronadjeni.");
	    }
		return doktori;
	}
	
	public Doktor findOne(Long id) {
		return doktorRepository.findById(id).orElseGet(null);
	}
	
	
	//--rucno dodati
	
	public Doktor addDoktor(Doktor doktor) throws Exception {
	  if (doktor.getId() != null) {
            throw new Exception(
                    "Id mora biti null prilikom perzistencije novog entiteta.");
        }
	  	Doktor savedDoktor = doktorRepository.save(doktor);
        return savedDoktor;
	}	
	
	public Doktor updateDoktor(Long id, Doktor doktor)throws Exception{
		Optional<Doktor>  doktorToUpdate =  doktorRepository.findById(id);
		if (doktorToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		Doktor updatedDoktor =  doktorRepository.save(doktor);
		return updatedDoktor ;
	}
	
	public void deleteDoktor(Long id) {
		 doktorRepository.deleteById(id);
	}

	public List<Doktor> findDoktorByKlinikaIdAndTipPregledaAndDatum(Long klinika_id, String testNazivPregled, LocalDate testDatum) {
	
		return doktorRepository.findDoktorByKlinikaIdAndTipPregledaAndDatum(klinika_id,testNazivPregled,testDatum);
	}

	public Doktor getDoktorByTerminId(Long termin_id) {
		return doktorRepository.findDoktorByTerminiId(termin_id);
	}
}