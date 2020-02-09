package io.isaBackend.model.klinika;
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
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.user.AdministratorKlinike;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.MedicinskaSestra;



@Entity
public class Klinika {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="klinika_id")
	private Long id;
	
	@Column(unique = true, nullable = false)
	private String naziv;
	@Column(unique = true, nullable = false)
	private String adresa;
	
	private String opis;

	@Column(nullable = false)
	private String cene; // ?map
	
	@Column(nullable = true)
	private double ocena;
	
	@Column(nullable = false)
	//jedna klinika ima vise pregleda 
	@JsonManagedReference
	@OneToMany(mappedBy = "klinika", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Pregled> pregledi;

	@Column(nullable = false)
	//jedna klinika moze da ima vise lekara
	@JsonManagedReference
	@OneToMany(mappedBy = "klinika", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Doktor> doktori;
	
	@Column(nullable = false)
//	jedna klinika moze da ima vise sala
	@JsonManagedReference
	@OneToMany(mappedBy="klinika",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Sala> sale;

	@Column(nullable = false)
	@JsonManagedReference
	//jedna klinika moze da ima vise administratoraKlinike 
	@OneToMany(mappedBy="klinika",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<AdministratorKlinike> administratoriKlinike;
	
	//jedna klinika moze da ima vise sestara 
	//U tabeli nurse ce dodati jos jednu kolonu koja ce predstavljati id klinike u kojoj radi.
	@JsonManagedReference
	@OneToMany(mappedBy = "klinika", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<MedicinskaSestra> medSestra;
	
	@ManyToMany
	@JoinTable(joinColumns = @JoinColumn(name = "klinika_id", referencedColumnName = "klinika_id"), inverseJoinColumns = @JoinColumn(name = "tip_pregleda_id", referencedColumnName = "id"))
	private Set<TipPregleda> tipPregleda = new HashSet<TipPregleda>();
	
	
	
	
	
	public Klinika() {
		// TODO Auto-generated constructor stub
	}

	public Klinika(String naziv, String adresa, String opis, Set<Pregled> pregledi,Set<Doktor> doktori,
			Set<Sala> sale, String cene, Set<AdministratorKlinike> administratoriKlinike,
			double ocena) {
		super();
		this.naziv = naziv;
		this.adresa = adresa;
		this.opis = opis;
		this.pregledi = pregledi;
		this.doktori = doktori;
		this.sale = sale;
		this.cene = cene; //String gde ce pisati usluga-cena;usluga2-cena2; pa cu ih splitovati po ;
		this.administratoriKlinike = administratoriKlinike;
		this.ocena = ocena;
	}

	public Set<Doktor> getDoktori() {
		return doktori;
	}

	public void setDoktori(Set<Doktor> doktori) {
		this.doktori = doktori;
	}

	public Set<MedicinskaSestra> getMedSestra() {
		return medSestra;
	}

	public void setMedSestra(Set<MedicinskaSestra> medSestra) {
		this.medSestra = medSestra;
	}

	public Set<AdministratorKlinike> getAdministratoriKlinike() {
		return administratoriKlinike;
	}

	public void setAdministratoriKlinike(Set<AdministratorKlinike> administratoriKlinike) {
		this.administratoriKlinike = administratoriKlinike;
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

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public Set<Pregled> getPregledi() {
		return pregledi;
	}

	public void setPregledi(Set<Pregled> pregledi) {
		this.pregledi = pregledi;
	}

	public Set<Sala> getSale() {
		return sale;
	}

	public void setSale(Set<Sala> sale) {
		this.sale = sale;
	}
	
	public String getCene() {
		return cene;
	}

	public void setCene(String cene) {
		this.cene = cene;
	}

	public double getOcena() {
		return ocena;
	}

	public void setOcena(double ocena) {
		this.ocena = ocena;
	}
	
}