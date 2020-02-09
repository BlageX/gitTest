package io.isaBackend.model.klinika;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.isaBackend.model.report.IzvestajPregleda;
import io.isaBackend.model.user.Doktor;
import io.isaBackend.model.user.Pacijent;

@Entity
public class Pregled {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private LocalDate datum;
	
	@Column(nullable = false)
	private LocalTime vreme;
	
	@Column(nullable = false)
	private Long trajanje; 
	
	private Long termin_id;
	
	private boolean prosao;
	
	
	//jedan pregled pripada samo jednom tip pregleda
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private TipPregleda tipPregleda;
	
	//@Column(nullable = false)
	//Jedan pregled se vrsi u jednoj sali (druga strana bidireckije)
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Sala sala;	
 
	//Jedan pregled je izvrsen od strane jednog doktora (druga strana bidirekcije)
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Doktor doktor;
	
	@Column(nullable = false)
	private String cena;
	
	//Ako su predefinisani pregledi onda je ovo polje naknadno (automatski) popunjeno. ???
	
	//@Column(nullable = false)
	//Jedan pregled se obavlja samo na jednom pacijentu(druga strana bidirekcije)
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Pacijent pacijent;
	
	//jedan konkretan pregled se obavja u jednoj klinici 
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Klinika klinika;
	

	//Jedan izvestaj pregleda se kreira za jedan pregled.
	@OneToOne(fetch = FetchType.LAZY)
	private IzvestajPregleda izvestajPregleda;
	

	public Pregled() {
		// TODO Auto-generated constructor stub
	}

	public Pregled(LocalDate datum, LocalTime vreme, TipPregleda tipPregleda, Long trajanje, Sala sala, Doktor doktor, String cena,
			Pacijent pacijent, IzvestajPregleda izvestajPregleda) {
		super();
		this.datum = datum;
		this.vreme = vreme;
		this.tipPregleda = tipPregleda;
		this.trajanje = trajanje;
		this.sala = sala;
		this.doktor = doktor;
		this.cena = cena;
		this.pacijent = pacijent;
		this.izvestajPregleda = izvestajPregleda;
		this.prosao = false;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getDatum() {
		return datum;
	}

	public void setDatum(LocalDate datum) {
		this.datum = datum;
	}

	public LocalTime getVreme() {
		return vreme;
	}

	public void setVreme(LocalTime vreme) {
		this.vreme = vreme;
	}

	public Long getTrajanje() {
		return trajanje;
	}

	public void setTrajanje(Long trajanje) {
		this.trajanje = trajanje;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public TipPregleda getTipPregleda() {
		return tipPregleda;
	}

	public void setTipPregleda(TipPregleda tipPregleda) {
		this.tipPregleda = tipPregleda;
	}

	public Doktor getDoktor() {
		return doktor;
	}

	public void setDoktor(Doktor doktor) {
		this.doktor = doktor;
	}

	public String getCena() {
		return cena;
	}

	public void setCena(String cena) {
		this.cena = cena;
	}

	public Pacijent getPacijent() {
		return pacijent;
	}

	public void setPacijent(Pacijent pacijent) {
		this.pacijent = pacijent;
	}

	public Klinika getKlinika() {
		return klinika;
	}

	public void setKlinika(Klinika klinika) {
		this.klinika = klinika;
	}

	public IzvestajPregleda getIzvestajPregleda() {
		return izvestajPregleda;
	}

	public void setIzvestajPregleda(IzvestajPregleda izvestajPregleda) {
		this.izvestajPregleda = izvestajPregleda;
	}
	
	
	public Long getTerminId() {
		return termin_id;
	}

	public void setTerminId(Long termin_id) {
		this.termin_id = termin_id;
	}

	public boolean isProsao() {
		return prosao;
	}

	public void setProsao(boolean prosao) {
		this.prosao = prosao;
	}	

}