package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.repository.AdministratorKlinikeRepository;

@Service
public class AdministratorKlinikeService {
	
	@Autowired
	private AdministratorKlinikeRepository adminKlinikeRepository;
	
	public List<AdministratorKlinike> getAllAdministratorKlinike(){
	List<AdministratorKlinike> clinicAdministrator = new ArrayList<>();
	 		adminKlinikeRepository.findAll().forEach(clinicAdministrator::add);
		return clinicAdministrator;
	}
	
	public AdministratorKlinike findOne(Long id) {
		return adminKlinikeRepository.findById(id).orElseGet(null);
	}
	
	
	public AdministratorKlinike addAdministratorKlinike(AdministratorKlinike adminKlinike) throws Exception {
		  if (adminKlinike.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        AdministratorKlinike savedAdminKlinike =  adminKlinikeRepository.save(adminKlinike);
	        return savedAdminKlinike;
			//radnikRepository.save(radnik);
		}	
	
	
	public AdministratorKlinike updateAdministratorKlinike(Long id, AdministratorKlinike adminKlinike)throws Exception{
		Optional<AdministratorKlinike>  adminKlinikeToUpdate =  adminKlinikeRepository.findById(id);
		if (adminKlinikeToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		AdministratorKlinike updatedAdminKlinke =  adminKlinikeRepository.save(adminKlinike);
		return updatedAdminKlinke;
	}
	
	
	
	public void deleteAdministratorKlinike(Long id) {
		 adminKlinikeRepository.deleteById(id);
	}
}
