package io.isaBackend.model.report;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
//lek
public class Lek {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //baza generise id po redu pocev od 1;
	private Long id; 

	@Column(unique = true, nullable = false)
	private String naziv;
	
	//Jedan isti lek se moze naci u vise razlicitih recepata.
	//@JsonIgnore
	@ManyToMany
	private Set<Recept> recept = new HashSet<Recept>(); 
	
	public Lek() {
		// TODO Auto-generated constructor stub
	}

	public Lek(String naziv, Long id) {
		super();
		this.naziv = naziv;
		this.id = id;
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

	public Set<Recept> getRecept() {
		return recept;
	}

	public void setRecept(Set<Recept> recept) {
		this.recept = recept;
	}
	
}
