package io.isaBackend.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.MedicinskaSestra;
import io.isaBackend.repository.MedicinskaSestraRepository;


@Service
public class MedicinskaSestraService {

	@Autowired
	private MedicinskaSestraRepository medSestraRepository;
	
	public List<MedicinskaSestra> getAllMedicinskaSestra(){
	List<MedicinskaSestra> medSestre = new ArrayList<>();
		medSestraRepository.findAll().forEach(medSestre::add);
		return medSestre;
	}
	
//	public Optional<MedicinskaSestra> getMedicinskaSestra(Long id) {
//	return medSestraRepository.findById(id);
//	}
	
	public MedicinskaSestra findOne(Long id) {
		return medSestraRepository.findById(id).orElseGet(null);
	}
	
	
	public MedicinskaSestra  addMedicinskaSestra(MedicinskaSestra medSestra) throws Exception {
		  if (medSestra.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        MedicinskaSestra savedMedSestra = medSestraRepository.save(medSestra);
	        return savedMedSestra;
		}	
	
	
	public  MedicinskaSestra  updateMedicinskaSestra(Long id, MedicinskaSestra medSestra)throws Exception{
		Optional<MedicinskaSestra>  medSestraToUpdate =  medSestraRepository.findById(id);
		if (medSestra == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		MedicinskaSestra updatedMedSestra =  medSestraRepository.save(medSestra);
		return updatedMedSestra;
	}
	
	public void deleteMedicinskaSestra(Long id) {
		medSestraRepository.deleteById(id);
	}
}
