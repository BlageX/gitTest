package io.isaBackend.dto;

import java.util.Set;

import io.isaBackend.model.report.Lek;
import io.isaBackend.model.report.Recept;

public class LekDTO {
	
	private Long id; 
	private String naziv;
	
	public LekDTO() {
		
	}
	
	public LekDTO(Lek lek) {
		this(lek.getId(),lek.getNaziv());
	}
	
	public LekDTO(Long id, String naziv) {
		super();
		this.id = id;
		this.naziv = naziv;
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

	
}
