package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.ZdravstveniKarton;
import io.isaBackend.model.user.User;
import io.isaBackend.repository.ZdravstveniKartonRepository;

@Service
public class ZdravstveniKartonService {
	
	@Autowired
	private ZdravstveniKartonRepository zdrKartonRepository;
	
	public List<ZdravstveniKarton> getAllZdravstveniKarton(){
		List<ZdravstveniKarton> zdrKarton = new ArrayList<>();
			zdrKartonRepository.findAll().forEach(zdrKarton::add);
			return zdrKarton;
		}
		
//		public Optional<ZdravstveniKarton> getZdravstveniKarton(Long id) {
//			return zdrKartonRepository.findById(id);
//		}
	
	public ZdravstveniKarton findOne(Long id) {
		return zdrKartonRepository.findById(id).orElseGet(null);
	}
	
	
	public ZdravstveniKarton addZdravstveniKarton(ZdravstveniKarton zdrKarton) throws Exception {
		  if (zdrKarton.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        ZdravstveniKarton savedZdrKarton = zdrKartonRepository.save(zdrKarton);
	        return savedZdrKarton ;
		}
	

	
	
	public ZdravstveniKarton updateZdravstveniKarton(Long id, ZdravstveniKarton zdrKarton)throws Exception{
		Optional<ZdravstveniKarton> zdrKartonToUpdate =  zdrKartonRepository.findById(id);
		if (zdrKartonToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		ZdravstveniKarton updatedZdrKartonToUpdate =  zdrKartonRepository.save(zdrKarton);
		return updatedZdrKartonToUpdate;
	}
		
		public void deleteZdravstveniKarton(Long id) {
			zdrKartonRepository.deleteById(id);
		}
}