package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.user.AdministratorKlinickogCentra;
import io.isaBackend.repository.AdministratorKlinickogCentraRepository;

@Service
public class AdministratorKlinickogCentraService {
	
	@Autowired
	private  AdministratorKlinickogCentraRepository  adminKlinCentraRepository;
	
	public List< AdministratorKlinickogCentra> getAllAdministratorKlinickogCentra(){
		List< AdministratorKlinickogCentra>  adminKlinCentra = new ArrayList<>();
			adminKlinCentraRepository.findAll().forEach(adminKlinCentra::add);
			return adminKlinCentra;
		}

		public AdministratorKlinickogCentra findOne(Long id) {
			return adminKlinCentraRepository.findById(id).orElseGet(null);
		}
		
		public AdministratorKlinickogCentra addAdministratorKlinickogCentra( AdministratorKlinickogCentra adminKlinCentra)throws Exception{
			  if (adminKlinCentra.getId() != null) {
		            throw new Exception(
		                    "Id mora biti null prilikom perzistencije novog entiteta.");
		        }
		        AdministratorKlinickogCentra savedAdminKlinCentra = adminKlinCentraRepository.save(adminKlinCentra);;
		        return savedAdminKlinCentra;
			
		}
		
		public AdministratorKlinickogCentra updateAdministratorKlinickogCentra(Long id, AdministratorKlinickogCentra adminKlinCentra) throws Exception {
			Optional<AdministratorKlinickogCentra> adminKlinCentraToUpadet = adminKlinCentraRepository.findById(id);
			if (adminKlinCentraToUpadet == null) {
		           throw new Exception("Trazeni entitet nije pronadjen.");
		    }
			AdministratorKlinickogCentra updateAdminKilCentra = adminKlinCentraRepository.save(adminKlinCentra);
			return updateAdminKilCentra;
		}
		
		public void deleteAdministratorKlinickogCentra(Long id) {
			adminKlinCentraRepository.deleteById(id);
		}
}
