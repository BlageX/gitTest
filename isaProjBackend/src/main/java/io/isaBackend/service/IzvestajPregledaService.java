package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.repository.IzvestajPregledaRepository;

@Service
public class IzvestajPregledaService {

	@Autowired
	private IzvestajPregledaRepository izvPreReopsitory;
	
	public List<IzvestajPregleda> getAllIzvestajPregleda(){
		List<IzvestajPregleda> izvPregleda = new ArrayList<>();
			izvPreReopsitory.findAll().forEach(izvPregleda::add);
			return izvPregleda;
	}
		
	public IzvestajPregleda findOne(Long id) {
		return izvPreReopsitory.findById(id).orElseGet(null);
	}
	
	public IzvestajPregleda addIzvestajPregleda(IzvestajPregleda izvPregleda) throws Exception {
		  if (izvPregleda.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
		  	IzvestajPregleda savedIzvPregleda = izvPreReopsitory.save(izvPregleda);
	        return savedIzvPregleda;
		}	
	
	public IzvestajPregleda updateIzvestajPregleda(Long id, IzvestajPregleda izvPregleda)throws Exception{
		Optional<IzvestajPregleda>  izvPregledaToUpdate =  izvPreReopsitory.findById(id);
		if (izvPregledaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		IzvestajPregleda updatedIzvPregleda =  izvPreReopsitory.save(izvPregleda);
		return updatedIzvPregleda; 
	}
	
	public void deleteIzvestajPregleda(Long id) {
		izvPreReopsitory.deleteById(id);
	}

}
