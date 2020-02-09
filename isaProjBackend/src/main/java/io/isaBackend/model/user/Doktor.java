package io.isaBackend.model.user;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.klinika.Termin;
import io.isaBackend.model.klinika.TipPregleda;


@Entity
public class Doktor {

	private static final long serialVersionUID = 1L;

	//Obrisi kada dodas User
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="doktor_id")
	private Long id;
	
	@Column(name = "role")
	private static final String role = "doctor";

	@Column(nullable = false)
	private String ime;

	@Column( nullable = false)
	private String prezime;

	//Radno vreme
	@Column(nullable = false)
	private String radnoVreme;

	//prosenca ocena
	@Column( nullable = true)
	private double ocena;

	//vise doktora moze da radi jedan tip pregleda(druga strana bi direkcije)
	
	//@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private TipPregleda tipPregleda;

	//vise doktora moze da radi u jednoj klinici(druga strana bi direkcije)
	@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Klinika klinika;
	
	//Jedan doktor moze da vrsi vise pregleda (u pregledu se cuva id doktora koji ga vrsi)
	@JsonManagedReference
	@OneToMany(mappedBy="doktor",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	Set<Pregled> pregled = new HashSet<Pregled>();
	
	//Jedan lekar moze obavljati vise operacija.
	@JsonIgnore
	@JsonBackReference
	@ManyToMany(mappedBy="doktori")
	private Set<Operacija> operacija = new HashSet<Operacija>();
	
	@OneToMany(mappedBy="doktor", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Termin> termini;
	
	//obrisati nakon dodavanja usera?
	public Doktor() {}

	public Doktor(String username, String password, boolean enabled, Timestamp lastPasswordResetDate,
			/*List<Authority> authorities,*/ String ime, String prezime, String radnoVreme,double ocena) {
//		super(username, password, enabled, lastPasswordResetDate, authorities);
		this.ime= ime;
		this.prezime = prezime;
		this.radnoVreme = radnoVreme;
		this.ocena = ocena;

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

	public static String getRole() {
		return role;
	}

	//dodato

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TipPregleda getTipPregleda() {
		return tipPregleda;
	}

	public void setTipPregleda(TipPregleda tipPregleda) {
		this.tipPregleda = tipPregleda;
	}

	public Klinika getKlinika() {
		return klinika;
	}

	public void setKlinika(Klinika klinika) {
		this.klinika = klinika;
	}

	public Set<Pregled> getPregled() {
		return pregled;
	}

	public void setPregled(Set<Pregled> pregled) {
		this.pregled = pregled;
	}

	public Set<Operacija> getOperacija() {
		return operacija;
	}

	public void setOperacija(Set<Operacija> operacija) {
		this.operacija = operacija;
	}

	public Set<Termin> getTermini() {
		return termini;
	}

	public void setTermini(Set<Termin> termini) {
		this.termini = termini;
	}


	
}
