package io.isaBackend.dto;

import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.user.Doktor;

public class OperacijaDTO {
	private Long id;
	private String datum;
	private String vreme;
	private String trajanje;
	private SalaDTO sala;
	private Set<DoktorDTO> doktori;
	private PacijentDTO pacijent;
	
	public OperacijaDTO() {
		
	}
	
	public OperacijaDTO(Operacija operacija) {
		this.id = operacija.getId();
		this.datum = operacija.getDatum();
		this.vreme = operacija.getVreme();
		this.trajanje = operacija.getTrajanje();
		this.sala = new SalaDTO(operacija.getSala());
		this.pacijent = new PacijentDTO(operacija.getPacijent()); 
		
		//Da prikaze sve doktore koji su vezani za tu opearciju
		Set<Doktor> pomDoktori = operacija.getDoktori();
		doktori = new HashSet<DoktorDTO>();
		for (Doktor d : pomDoktori) {
			doktori.add(new DoktorDTO(d));
		}
	}
	
	public OperacijaDTO(Long id, String datum, String vreme, String trajanje, SalaDTO sala, Set<DoktorDTO> doktori,
			PacijentDTO pacijent) {
		super();
		this.id = id;
		this.datum = datum;
		this.vreme = vreme;
		this.trajanje = trajanje;
		this.sala = sala;
		this.doktori = doktori;
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


	public SalaDTO getSala() {
		return sala;
	}


	public void setSala(SalaDTO sala) {
		this.sala = sala;
	}


	public Set<DoktorDTO> getDoktori() {
		return doktori;
	}


	public void setDoktori(Set<DoktorDTO> doktori) {
		this.doktori = doktori;
	}


	public PacijentDTO getPacijent() {
		return pacijent;
	}


	public void setPacijent(PacijentDTO pacijent) {
		this.pacijent = pacijent;
	}		
}
