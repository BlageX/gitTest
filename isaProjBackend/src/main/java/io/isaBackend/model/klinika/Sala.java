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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
public class Sala {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //baza generise id po redu pocev od 1;
	private Long id; 
	
	@Column(/*unique = true,*/ nullable = false)
	private String naziv;
	
	@Column(/*unique = true,*/ nullable = false)
	private String broj;

	@Column(nullable = false)
	private boolean rezervisana;
	
	//U jednoj sali moze da se izvrsi vise pregleda (kod svakog pregleda ce pisati id sale u kojoj je)
	@JsonManagedReference
	@OneToMany(mappedBy="sala",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	Set<Pregled> pregled = new HashSet<Pregled>();

	//U jednoj sali moze da se izvrsi vise operacija (kod svake sale ce pisati id sale u kojoj je)
	@JsonManagedReference
	@OneToMany(mappedBy="sala",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	Set<Operacija> operacija = new HashSet<Operacija>();
	
	//Vise sala moze se nalaziti u jednoj klinici:
	@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Klinika klinika;
	
	
	public Sala() {
		// TODO Auto-generated constructor stub
	}

	public Sala(String naziv, String broj, boolean rezervisana) {
		super();
		this.naziv = naziv;
		this.broj = broj;
		this.rezervisana = rezervisana;
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
	
	public Klinika getKlinika() {
		return klinika;
	}

	public void setKlinika(Klinika klinika) {
		this.klinika = klinika;
	}


}
