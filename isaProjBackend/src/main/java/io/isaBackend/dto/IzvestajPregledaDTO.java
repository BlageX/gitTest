package io.isaBackend.dto;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.report.Recept;
import io.isaBackend.model.report.ZdravstveniKarton;

//DTO za kreiranje izvestajaPregleda, za izlistavanje izvestaja u zdravstvenom kartonu napraviti novi DTO;
public class IzvestajPregledaDTO {
	
	private Long id;
	private String opisPregleda;
	
	private ReceptDTO recept; 
//	private ZdravstveniKartonDTO zdravstveniKarton;
	private DijagnozaDTO dijagnoza;
	private PredefPregledDTO pregled;
	
	public IzvestajPregledaDTO() {
		
	}
	
	public IzvestajPregledaDTO(IzvestajPregleda izvPregleda) {
		this.id = izvPregleda.getId();
		this.opisPregleda = izvPregleda.getOpisPregleda();
		this.recept = new ReceptDTO(izvPregleda.getRecept());
//		this.zdravstveniKarton = new ZdravstveniKartonDTO(izvPregleda.getZdravstveniKarton());
		this.dijagnoza = new DijagnozaDTO(izvPregleda.getDijagnoza());
//		this.pregled = new PredefPregledDTO(izvPregleda.getPregled());
	}
	
	public IzvestajPregledaDTO(Long id, String opisPregleda, ReceptDTO recept, ZdravstveniKartonDTO zdravstveniKarton,
			DijagnozaDTO dijagnoza/*,PredefPregledDTO pregled*/) {
		super();
		this.id = id;
		this.opisPregleda = opisPregleda;
		this.recept = recept;
//		this.zdravstveniKarton = zdravstveniKarton;
		this.dijagnoza = dijagnoza;
		this.pregled = pregled;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public DijagnozaDTO getDijagnoza() {
		return dijagnoza;
	}

	public void setDijagnoza(DijagnozaDTO dijagnoza) {
		this.dijagnoza = dijagnoza;
	}

	public ReceptDTO getRecept() {
		return recept;
	}
	
	public void setRecept(ReceptDTO recept) {
		this.recept = recept;
	}
	
//	public ZdravstveniKartonDTO getZdravstveniKarton() {
//		return zdravstveniKarton;
//	}
//	
//	public void setZdravstveniKarton(ZdravstveniKartonDTO zdravstveniKarton) {
//		this.zdravstveniKarton = zdravstveniKarton;
//	}
	
	public String getOpisPregleda() {
		return opisPregleda;
	}
	
	public void setOpisPregleda(String opisPregleda) {
		this.opisPregleda = opisPregleda;
	}

	public PredefPregledDTO getPregled() {
		return pregled;
	}

	public void setPregled(PredefPregledDTO pregled) {
		this.pregled = pregled;
	}
}
