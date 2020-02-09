package io.isaBackend.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import io.isaBackend.model.klinika.Pregled;

public class PredefPregledDTO {
	
	private Long id;
	private LocalDate datum;
	private LocalTime vreme;
	private String cena;
	private Long trajanje;
	
	private TipPregledaDTO tipPregleda;
	private SalaDTO sala;
	private DoktorDTO doktor;
	private PacijentDTO pacijent;
	private IzvestajPregledaDTO izvPregleda;
	
	private Long termin_id;
	private boolean prosao;
	
	
	public PredefPregledDTO() {
		
	}
	
	public PredefPregledDTO(Pregled pregled) {
		this.id = pregled.getId();
		this.datum = pregled.getDatum();
		this.vreme = pregled.getVreme();
		this.trajanje = pregled.getTrajanje();
		this.cena = pregled.getCena();
		
		this.tipPregleda = new TipPregledaDTO(pregled.getTipPregleda());
		this.sala = new SalaDTO(pregled.getSala());
		this.doktor = new DoktorDTO(pregled.getDoktor());
		
		if(pregled.getPacijent() != null) {
			this.pacijent = new PacijentDTO(pregled.getPacijent());
		}
		
		this.izvPregleda = new IzvestajPregledaDTO(pregled.getIzvestajPregleda());
	}
	
	public PredefPregledDTO(Long id, LocalDate datum, LocalTime vreme, TipPregledaDTO tipPregleda, Long trajanje, SalaDTO sala, DoktorDTO doktor,
			String cena, PacijentDTO pacijent, IzvestajPregledaDTO izvPregleda) {
		super();
		this.id = id;
		this.datum = datum;
		this.vreme = vreme;
		this.tipPregleda = tipPregleda;
		this.trajanje = trajanje;
		this.sala = sala;
		this.doktor = doktor;
		this.cena = cena;
		this.pacijent = pacijent;
		this.izvPregleda = izvPregleda;
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

	public String getCena() {
		return cena;
	}
	public void setCena(String cena) {
		this.cena = cena;
	}

	public TipPregledaDTO getTipPregleda() {
		return tipPregleda;
	}

	public void setTipPregleda(TipPregledaDTO tipPregleda) {
		this.tipPregleda = tipPregleda;
	}

	public SalaDTO getSala() {
		return sala;
	}

	public void setSala(SalaDTO sala) {
		this.sala = sala;
	}

	public DoktorDTO getDoktor() {
		return doktor;
	}

	public void setDoktor(DoktorDTO doktor) {
		this.doktor = doktor;
	}

	public PacijentDTO getPacijent() {
		return pacijent;
	}

	public void setPacijent(PacijentDTO pacijent) {
		this.pacijent = pacijent;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public IzvestajPregledaDTO getIzvPregleda() {
		return izvPregleda;
	}

	public void setIzvPregleda(IzvestajPregledaDTO izvPregleda) {
		this.izvPregleda = izvPregleda;
	}

	public Long getTermin_id() {
		return termin_id;
	}

	public void setTermin_id(Long termin_id) {
		this.termin_id = termin_id;
	}

	public boolean isProsao() {
		return prosao;
	}

	public void setProsao(boolean prosao) {
		this.prosao = prosao;
	}	
	
	
	
	
	
}
