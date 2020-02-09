package io.isaBackend.model.report;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.user.Pacijent;

import java.util.ArrayList;
import java.util.Set;

@Entity
public class ZdravstveniKarton{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long id;
	
	private String visina;
	private String tezina;
	private String krvnaGrupa;
	private String alergija;
	private String dioptrija;

//	@JsonIgnore
//	@OneToOne(mappedBy="zdravstveniKarton",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	Pacijent pacijent = new Pacijent();
	
	//U jednom zdravstvenomKartonu se moze naci vise izvestaja( u tabeli izvestaja pregleda se nalazi id zdravstvenog kartona kojem pripada)
//	@JsonManagedReference
//	@OneToMany(mappedBy="zdravstveniKarton",fetch = FetchType.LAZY)
//	private Set<IzvestajPregleda> izvestaji;


	public ZdravstveniKarton() {
		// TODO Auto-generated constructor stub
	}
	
	public ZdravstveniKarton(Long id, String visina, String tezina, String krvnaGrupa, String alergija,
			String dioptrija/*, Pacijent pacijent, Set<IzvestajPregleda> izvestaji*/) {
		super();
		this.id = id;
		this.visina = visina;
		this.tezina = tezina;
		this.krvnaGrupa = krvnaGrupa;
		this.alergija = alergija;
		this.dioptrija = dioptrija;
		//this.pacijent = pacijent;
		//this.izvestaji = izvestaji;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}	

	public String getVisina() {
		return visina;
	}

	public void setVisina(String visina) {
		this.visina = visina;
	}

	public String getTezina() {
		return tezina;
	}

	public void setTezina(String tezina) {
		this.tezina = tezina;
	}

	public String getKrvnaGrupa() {
		return krvnaGrupa;
	}

	public void setKrvnaGrupa(String krvnaGrupa) {
		this.krvnaGrupa = krvnaGrupa;
	}

	public String getAlergija() {
		return alergija;
	}

	public void setAlergija(String alergija) {
		this.alergija = alergija;
	}

	public String getDioptrija() {
		return dioptrija;
	}

	public void setDioptrija(String dioptrija) {
		this.dioptrija = dioptrija;
	}

//	public Pacijent getPacijent() {
//		return pacijent;
//	}
//
//	public void setPacijent(Pacijent pacijent) {
//		this.pacijent = pacijent;
//	}

//	public Set<IzvestajPregleda> getIzvestaji() {
//		return izvestaji;
//	}
//
//	public void Set(Set<IzvestajPregleda> izvestaji) {
//		this.izvestaji = izvestaji;
//	}
	
}
