 package io.isaBackend.dto;

import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.report.Dijagnoza;
import io.isaBackend.model.report.IzvestajPregleda;

public class DijagnozaDTO {

	private Long id;
	private String naziv;
	
	//Treba mozda DTO za Izvestaj pregleda  
	
	public DijagnozaDTO() {
		
	}
	
	public DijagnozaDTO(Dijagnoza dijagnoza) {
		this(dijagnoza.getId(),dijagnoza.getNaziv());
	}
	
	public DijagnozaDTO(Long id, String naziv) {
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
