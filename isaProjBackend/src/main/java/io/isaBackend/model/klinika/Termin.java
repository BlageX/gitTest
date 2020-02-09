 package io.isaBackend.model.klinika;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import io.isaBackend.model.user.Doktor;

import java.time.LocalDate; // import the LocalDate class
import java.time.LocalTime;

@Entity
public class Termin {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="termin_id")
	private Long id;
	
//	LocalDate myObjDate = LocalDate.now(); // Create a date object
//	LocalTime myObjTime = LocalTime.now();
	
	private LocalDate datum;
	private LocalTime pocetakTermina;
	private LocalTime krajTermina;
	private boolean slobodan;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Doktor doktor;
	
	
	public Termin() {}
	
	public Termin(Long id, LocalDate datum, LocalTime pocetakTermina, LocalTime krajTermina, boolean slobodan,
			Doktor doktor) {
		super();
		this.id = id;
		this.datum = datum;
		this.pocetakTermina = pocetakTermina;
		this.krajTermina = krajTermina;
		this.slobodan = slobodan;
		this.doktor = doktor;
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

	public Doktor getDoktor() {
		return doktor;
	}

	public void setDoktor(Doktor doktor) {
		this.doktor = doktor;
	}

	
	
}
//	
//	//jedan isti termin (npr od 10:00 - 12:00) moze biti u vise razlicitih dana.
//	@ManyToMany(mappedBy="termini")
//	private Set<Dan> dani = new HashSet<Dan>();
//	
//	// KONSTRUKTORI
//	
//	public Termin() {
//		
//		vremeTermina = "00:00-00:00";
//		slobodan = true;
//	}
//	
//	public Termin(String vremeTermina, boolean slobodan) {
//		super();
//		this.vremeTermina = vremeTermina;
//		this.slobodan = slobodan;
//	}
//	
//	// ----------------
//	
//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public Set<Dan> getDani() {
//		return dani;
//	}
//
//	public void setDani(Set<Dan> dani) {
//		this.dani = dani;
//	}
//
//	public String getVremeTermina() {
//		return vremeTermina;
//	}
//	
//	public void setVremeTermina(String vremeTermina) {
//		this.vremeTermina = vremeTermina;
//	}
//	
//	public void setSlobodan(boolean slobodan) {
//		this.slobodan = slobodan;
//	}
//	
//	public boolean isSlobodan() {
//		return slobodan;
//	}
//
//}
