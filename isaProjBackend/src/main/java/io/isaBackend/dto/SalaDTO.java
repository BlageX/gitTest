package io.isaBackend.dto;

import io.isaBackend.model.klinika.Sala;

public class SalaDTO {
	
	private Long id; 
	private String naziv;
	private String broj;
	private boolean rezervisana;
	//private KlinikaDTO klinika;
	
	public SalaDTO() {
		
	}
	
	public SalaDTO(Sala sala) {
		this.id = sala.getId();
		this.naziv = sala.getNaziv();
		this.broj = sala.getBroj();
		this.rezervisana = sala.isRezervisana();
	//	klinika = new KlinikaDTO(sala.getKlinika());
	}

	public SalaDTO(Long id, String naziv, String broj, boolean rezervisana/*, KlinikaDTO klinika*/) {
		super();
		this.id = id;
		this.naziv = naziv;
		this.broj = broj;
		this.rezervisana = rezervisana;
	//	this.klinika = klinika;
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

	public String getBroj() {
		return broj;
	}

	public void setBroj(String broj) {
		this.broj = broj;
	}

	public boolean isRezervisana() {
		return rezervisana;
	}

	public void setRezervisana(boolean rezervisana) {
		this.rezervisana = rezervisana;
	}

//	public KlinikaDTO getKlinika() {
//		return klinika;
//	}
//
//	public void setKlinika(KlinikaDTO klinika) {
//		this.klinika = klinika;
//	}
	
}
