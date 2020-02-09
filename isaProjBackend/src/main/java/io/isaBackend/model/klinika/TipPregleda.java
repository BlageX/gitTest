package io.isaBackend.model.klinika;

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
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.user.Doktor;

@Entity
public class TipPregleda {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //baza generise id po redu pocev od 1;
	private Long id;
	
	@Column(unique = true, nullable = false)
	private String naziv;
	
	@Column(nullable = false)
	private String cena; //originalna cena, kod predefPregleda cena - mora biti manja pa je to cena sa popustom
	
	public TipPregleda() {
		// TODO Auto-generated constructor stub
	}

	public TipPregleda(String naziv) {
		super();
		this.naziv = naziv;
		this.cena = cena;
	}
	
	//Jedan tip pregleda moze da ima vise doktora koji ga obavljaju.
	@JsonManagedReference
	@OneToMany(mappedBy = "tipPregleda", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Doktor> doktor;
	
	//Jedan tip pregleda moze da pripada vecem broju pregleda
	@JsonManagedReference
	@OneToMany(mappedBy = "tipPregleda", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Pregled> pregled;
	
	@ManyToMany(mappedBy="tipPregleda")
	private Set<Klinika> klinike = new HashSet<Klinika>();
	
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

	//dodato
	public Set<Doktor> getDoktor() {
		return doktor;
	}

	public void setDoktor(Set<Doktor> doktor) {
		this.doktor = doktor;
	}

	public Set<Pregled> getPregled() {
		return pregled;
	}

	public void setPregled(Set<Pregled> pregled) {
		this.pregled = pregled;
	}

	public String getCena() {
		return cena;
	}

	public void setCena(String cena) {
		this.cena = cena;
	}

	public Set<Klinika> getKlinike() {
		return klinike;
	}

	public void setKlinike(Set<Klinika> klinike) {
		this.klinike = klinike;
	}
	
	
}
