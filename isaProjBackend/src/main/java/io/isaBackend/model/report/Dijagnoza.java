package io.isaBackend.model.report;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Dijagnoza {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(unique = true, nullable = false)
	private String naziv;

	//Jedna dijagnoza moze biti u vise izvestaja pregleda(u tabeli izvestaj pregleda se cuva id dijagnoza)
	@JsonManagedReference
	@OneToMany(mappedBy="dijagnoza",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<IzvestajPregleda> izvestajPregleda  = new HashSet<IzvestajPregleda>();
	
	
	public Dijagnoza() {
		// TODO Auto-generated constructor stub
	}

	public Dijagnoza(String naziv, Long id) {
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

}
