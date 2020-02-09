package io.isaBackend.dto;

import io.isaBackend.model.klinika.TipPregleda;

public class TipPregledaDTO {

	private Long id;
	private String naziv;
	private String cena;
	
	
	public TipPregledaDTO() {
		
	}
	
	public TipPregledaDTO(TipPregleda tipPregleda) {
		this(tipPregleda.getId(), tipPregleda.getNaziv(), tipPregleda.getCena());
	}
	
	public TipPregledaDTO(Long id, String naziv, String cena) {
		super();
		this.id = id;
		this.naziv = naziv;
		this.cena = cena;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getCena() {
		return cena;
	}

	public void setCena(String cena) {
		this.cena = cena;
	}
	
	
}
