package io.isaBackend.dto;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.klinika.Termin;
//import io.isaBackend.model.klinika.RadnaNedelja;
//import io.isaBackend.model.klinika.Termin;
import io.isaBackend.model.user.Doktor;

public class DoktorDTO {

	private String role;

	private Long id;
	private String ime;
	private String prezime;
	private String radnoVreme;
	private double ocena;
	
	private TipPregledaDTO tipPregleda;
	private Set<TerminDTO> termini;

	public DoktorDTO() {}
	
	public DoktorDTO( String role, Long id,/* String username, String password, ,*/ String ime, String prezime, String radnoVreme, double Ocena,TipPregledaDTO tipPregleda/*, RadnaNedeljaDTO radnaNedelja*/) {
		this.role = role;
		this.id = id;
		this.ime= ime;
		this.prezime = prezime;
		this.radnoVreme = radnoVreme;
		this.ocena = ocena;
		this.tipPregleda = tipPregleda;
		
	}
	


	
	
	public DoktorDTO(Doktor doktor) {
		this.role = doktor.getRole();
		this.id = doktor.getId();
		this.ime= doktor.getIme();
		this.prezime = doktor.getPrezime();
		this.radnoVreme = doktor.getRadnoVreme();
		this.ocena = doktor.getOcena();
		this.tipPregleda = new TipPregledaDTO(doktor.getTipPregleda());
	
		Set<Termin> pomTermin = doktor.getTermini();
		termini = new HashSet<TerminDTO>();
		for (Termin t : pomTermin) {
			if(t.isSlobodan() == true) {
				termini.add(new TerminDTO(t));
			}
		}
	}


	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIme() {
		return ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPrezime() {
		return prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getRadnoVreme() {
		return radnoVreme;
	}

	public void setRadnoVreme(String radnoVreme) {
		this.radnoVreme = radnoVreme;
	}

	public double getOcena() {
		return ocena;
	}

	public void setOcena(double ocena) {
		this.ocena = ocena;
	}

	public TipPregledaDTO getTipPregleda() {
		return tipPregleda;
	}

	public void setTipPregleda(TipPregledaDTO tipPregleda) {
		this.tipPregleda = tipPregleda;
	}

	public Set<TerminDTO> getTermini() {
		return termini;
	}

	public void setTermini(Set<TerminDTO> termini) {
		this.termini = termini;
	}
}
