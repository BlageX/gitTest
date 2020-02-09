package io.isaBackend.model.report;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.user.MedicinskaSestra;

@Entity
public class Recept {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	//Jedan recept sadrzi vise lekova
//	@JsonManagedReference
	@ManyToMany
	@JoinTable(name = "sePrepisuje", joinColumns = @JoinColumn(name = "recept_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "lek_id", referencedColumnName = "id"))
	private Set<Lek> lekovi;

	//@Column(nullable = false)
	//Recepti su potpisani od strane samo jedne sestre(druga strana bidirekcije)
//	@JsonIgnore
//	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private MedicinskaSestra medSestra;

	
//	//Jedan recept moze imati biti u vise razlicith izvestaja pregleda(u tabeli izvestajPregleda se cuva id recepta koji se u njemu nalazi)
	@JsonManagedReference
	@OneToMany(mappedBy="recept",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<IzvestajPregleda> izvestajPregleda = new HashSet<IzvestajPregleda>();
	
	public Recept() {
		// TODO Auto-generated constructor stub
	}

	public Recept(Set<Lek> lekovi, MedicinskaSestra medSestra) {
		super();
		this.lekovi = lekovi;
		this.medSestra = medSestra;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<Lek> getLekovi() {	
		return lekovi;
	}

	public void setLekovi(Set<Lek> lekovi) {	
		this.lekovi = lekovi;
	}

	public MedicinskaSestra getMedSestra() {
		return medSestra;
	}

	public void setMedSestra(MedicinskaSestra medSestra) {
		this.medSestra = medSestra;
	}

}
