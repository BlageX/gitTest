package io.isaBackend.dto;

import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.report.Lek;
import io.isaBackend.model.report.Recept;



public class ReceptDTO {

	
	private Long id;
	
	private Set<LekDTO> lekovi;

	private MedicinskaSestraDTO medSestra;
	
	
	public ReceptDTO() {
		
	}
	
	public ReceptDTO(Recept recept) {
		this.id = recept.getId();
		medSestra = new MedicinskaSestraDTO(recept.getMedSestra());
		
		
		Set<Lek> pomLekovi = recept.getLekovi();
		lekovi = new HashSet<LekDTO>();
		for(Lek l : pomLekovi) {
			lekovi.add(new LekDTO(l));
		}		
	}

	public ReceptDTO(Long id, Set<LekDTO> lekovi, MedicinskaSestraDTO medSestra) {
		super();
		this.id = id;
		this.lekovi = lekovi;
		this.medSestra = medSestra;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<LekDTO> getLekovi() {
		return lekovi;
	}

	public void setLekovi(Set<LekDTO> lekovi) {
		this.lekovi = lekovi;
	}

	public MedicinskaSestraDTO getMedSestra() {
		return medSestra;
	}

	public void setMedSestra(MedicinskaSestraDTO medSestra) {
		this.medSestra = medSestra;
	}

}
