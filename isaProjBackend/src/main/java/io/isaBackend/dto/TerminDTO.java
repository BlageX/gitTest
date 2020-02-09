package io.isaBackend.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import io.isaBackend.model.klinika.Termin;

public class TerminDTO {
	
	private Long id;
	private LocalDate datum;
	private LocalTime pocetakTermina;
	private LocalTime krajTermina;
	private boolean slobodan;
	
	
	public TerminDTO() {}
	
	public TerminDTO(Termin termin) {
		this.id = termin.getId();
		this.datum = termin.getDatum();
		this.pocetakTermina = termin.getPocetakTermina();
		this.krajTermina = termin.getKrajTermina();
		this.slobodan = termin.isSlobodan();
	}
	
	public TerminDTO(Long id, LocalDate datum, LocalTime pocetakTermina, LocalTime krajTermina, boolean slobodan) {
		super();
		this.id = id;
		this.datum = datum;
		this.pocetakTermina = pocetakTermina;
		this.krajTermina = krajTermina;
		this.slobodan = slobodan;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public LocalDate getDatum() {
		return datum;
	}
	public void setDatum(LocalDate datum) {
		this.datum = datum;
	}
	public LocalTime getPocetakTermina() {
		return pocetakTermina;
	}
	public void setPocetakTermina(LocalTime pocetakTermina) {
		this.pocetakTermina = pocetakTermina;
	}
	public LocalTime getKrajTermina() {
		return krajTermina;
	}
	public void setKrajTermina(LocalTime krajTermina) {
		this.krajTermina = krajTermina;
	}
	public boolean isSlobodan() {
		return slobodan;
	}
	public void setSlobodan(boolean slobodan) {
		this.slobodan = slobodan;
	}
}