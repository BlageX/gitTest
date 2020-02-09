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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.Pacijent;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;

@Entity
public class Operacija {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private String datum;
	
	@Column(nullable = false)
	private String vreme; // satnica Data 
	
	@Column(nullable = false)
	private String trajanje;
	
	//Jedna operacija se vrsi u jednoj sali (druga strana bidireckije)
	@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Sala sala;	
	
	@Column(nullable = false)
	//Jednu operaciju obavlja vise lekara.
	@JsonManagedReference
	@ManyToMany
	@JoinTable(name="vrsiOperaciju",joinColumns = @JoinColumn(name = "operacija_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "doktor_id", referencedColumnName = "doktor_id"))
	private Set<Doktor> doktori = new HashSet<Doktor>();

	//Jedna operacija se obavlja samo na jednom pacijentu(druga strana bidirekcije)
	@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Pacijent pacijent;

	public Operacija() {
		// TODO Auto-generated constructor stub
	}

	public Operacija(String datum, String vreme, String trajanje, Sala sala, Set<Doktor> doktori,
			Pacijent pacijent) {
		super();
		this.datum = datum;
		this.vreme = vreme;
		this.trajanje = trajanje;
		this.sala = sala;
		this.doktori = doktori;
		this.pacijent = pacijent;
	}

	
	public Set<Doktor> getDoktori() {
		return doktori;
	}

	public void setDoktori(Set<Doktor> doktori) {
		this.doktori = doktori;
	}

	public Pacijent getPacijent() {
		return pacijent;
	}

	public void setPacijent(Pacijent pacijent) {
		this.pacijent = pacijent;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDatum() {
		return datum;
	}

	public void setDatum(String datum) {
		this.datum = datum;
	}

	public String getVreme() {
		return vreme;
	}

	public void setVreme(String vreme) {
		this.vreme = vreme;
	}

	public String getTrajanje() {
		return trajanje;
	}

	public void setTrajanje(String trajanje) {
		this.trajanje = trajanje;
	}
	
	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

}
