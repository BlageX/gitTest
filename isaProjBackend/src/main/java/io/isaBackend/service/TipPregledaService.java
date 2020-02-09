package io.isaBackend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.TipPregleda;
import io.isaBackend.repository.TipPregledaRepository;

@Service
public class TipPregledaService {

	@Autowired
	private TipPregledaRepository tipPregledaRepository;
	
	
	public List<TipPregleda> getAllTipPregleda(){
		List<TipPregleda> tipoviPregleda = new ArrayList<>();
			tipPregledaRepository.findAll().forEach(tipoviPregleda::add);
			return tipoviPregleda;
		}
		
//		public Optional<TipPregleda> getTipPregleda(Long id) {
//		return	tipPregledaRepository.findById(id);
//		}
	
	
	public TipPregleda findOne(Long id) {
		return tipPregledaRepository.findById(id).orElseGet(null);
	}
	
	
	public TipPregleda addTipPregleda(TipPregleda tipPregleda) throws Exception {
		  if (tipPregleda.getId() != null) {
	            throw new Exception(
	                    "Id mora biti null prilikom perzistencije novog entiteta.");
	        }
	        TipPregleda savedTipPregleda = tipPregledaRepository.save(tipPregleda);
	        return savedTipPregleda;
		}	
	
	
	public TipPregleda updateTipPregleda(Long id, TipPregleda tipPregleda)throws Exception{
		Optional<TipPregleda>  tipPregledaToUpdate = tipPregledaRepository.findById(id);
		if (tipPregledaToUpdate == null) {
	           throw new Exception("Trazeni entitet nije pronadjen.");
	    }
		
		TipPregleda updatedTipPregleda =  tipPregledaRepository.save(tipPregleda);
		return updatedTipPregleda;
	}
	
	public void deleteTipPregleda(Long id) {
		tipPregledaRepository.deleteById(id);
	}

	public List<TipPregleda> getAllTipPregledaByKlinikeId(Long klinika_id) {
		
		return tipPregledaRepository.findAllByKlinikeId(klinika_id);
	}
}