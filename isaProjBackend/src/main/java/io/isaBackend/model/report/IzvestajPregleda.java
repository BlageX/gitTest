package io.isaBackend.model.report;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.klinika.Pregled;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@Entity
public class IzvestajPregleda {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String opisPregleda;

	//Jedan izvestaj pregleda ima jednu dijagnozu(druga strana bidirekcije)
//	@JsonIgnore
//	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Dijagnoza dijagnoza;
	
	//Jedan recept pripada jednom izvestaujPregleda(druga strana bidirekcije)
//	@JsonIgnore
//	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Recept recept; 

	//Jedan izvestaj pregleda se nalazi u jednom zdravstvenom kartonu(druga strana bidirekcije)
//	@JsonIgnore
//	@JsonBackReference
//	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	private ZdravstveniKarton zdravstveniKarton;
	
// Unidirekciona veza 1-1 mora biti:
//	@OneToOne(fetch = FetchType.LAZY)
//	private Pregled pregled;
	
	public IzvestajPregleda() {
		// TODO Auto-generated constructor stub
	}

	public IzvestajPregleda(Dijagnoza dijagnoza, Recept recepti) {
		super();
		this.dijagnoza = dijagnoza;
		this.recept = recepti;
	}

	public Dijagnoza getDijagnoza() {
		return dijagnoza;
	}

	public void setDijagnoza(Dijagnoza dijagnoza) {
		this.dijagnoza = dijagnoza;
	}

//	public ZdravstveniKarton getZdravstveniKarton() {
//		return zdravstveniKarton;
//	}
//
//	public void setZdravstveniKarton(ZdravstveniKarton zdravstveniKarton) {
//		this.zdravstveniKarton = zdravstveniKarton;
//	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Recept getRecept() {
		return recept;
	}

	public void setRecept(Recept recept) {
		this.recept = recept;
	}

	public String getOpisPregleda() {
		return opisPregleda;
	}

	public void setOpisPregleda(String opisPregleda) {
		this.opisPregleda = opisPregleda;
	}

//	public Pregled getPregled() {
//		return pregled;
//	}
//
//	public void setPregled(Pregled pregled) {
//		this.pregled = pregled;
//	}
	
	
}
