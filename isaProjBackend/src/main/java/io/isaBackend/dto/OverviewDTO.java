package io.isaBackend.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import io.isaBackend.model.klinika.Pregled;

public class OverviewDTO {
	
	private Long idTermina;
	private LocalDate datum;
	private String vreme;
	private String cena;
	private String nazivKlinike;
	
	private String tipPregleda;
	private String doktor;
       
	public OverviewDTO() {
		   
	}   
	
//	public OverviewDTO(Pregled pregled) {
//		this.idTermina = pregled.getId();
//		this.datum = pregled.getDatum();
//		this.vreme = pregled.getVreme();
//		this.cena = pregled.getCena();
//		
////		this.tipPregleda = pregled.getTipPregleda();
////		this.doktor = pregled.getDoktor();
//	}
       
	public OverviewDTO(Long idTermina,String nazivKlinike, LocalDate datum, String vreme, String tipPregleda, String doktor, String cena) {
		super();
		this.idTermina = idTermina;
		this.datum = datum;
		this.vreme = vreme;
		this.tipPregleda = tipPregleda;
		this.doktor = doktor;
		this.cena = cena;
		this.nazivKlinike = nazivKlinike;
	}
	
	public LocalDate getDatum() {
		return datum;
	}

	public void setDatum(LocalDate datum) {
		this.datum = datum;
	}

	public String getVreme() {
		return vreme;
	}

	public void setVreme(String vreme) {
		this.vreme = vreme;
	}

	public String getTipPregleda() {
		return tipPregleda;
	}
	public void setTipPregleda(String tipPregleda) {
		this.tipPregleda = tipPregleda;
	}
	public String getDoktor() {
		return doktor;
	}
	public void setDoktor(String doktor) {
		this.doktor = doktor;
	}
	public String getCena() {
		return cena;
	}
	public void setCena(String cena) {
		this.cena = cena;
	}

	public Long getIdTermina() {
		return idTermina;
	}

	public void setIdTermina(Long idTermina) {
		this.idTermina = idTermina;
	}

	public String getNazivKlinike() {
		return nazivKlinike;
	}

	public void setNazivKlinike(String nazivKlinike) {
		this.nazivKlinike = nazivKlinike;
	}
}
