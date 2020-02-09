package io.isaBackend.dto;

import java.util.HashSet;
import java.util.Set;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.Doktor;

public class KlinikaDTO {

	private Long id;

	private String naziv;

	private String adresa;
	
	private String opis;

	private String cene;
	
	private double ocena;

	private Set<DoktorDTO> doktori;
	
	//private Set<SalaDTO> sale;
	
	public KlinikaDTO() {}
	
	public KlinikaDTO(Klinika klinika) {
		this.id=klinika.getId();
		this.naziv=klinika.getNaziv();
		this.adresa = klinika.getAdresa();
		this.opis = klinika.getOpis();
		this.cene= klinika.getCene();
		this.ocena= klinika.getOcena();
		
		Set<Doktor> pomDoktori = klinika.getDoktori();
		doktori = new HashSet<DoktorDTO>();
		for (Doktor d : pomDoktori) {
			doktori.add(new DoktorDTO(d));
		}
	}
	
	public KlinikaDTO(Long id, String naziv, String adresa, String opis, String cene, double ocena, Set<DoktorDTO> doktori) {
		super();
		this.id = id;
		this.naziv = naziv;
		this.adresa = adresa;
		this.opis = opis;
		this.cene = cene;
		this.ocena = ocena;
		this.doktori = doktori;
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

	public Set<DoktorDTO> getDoktori() {
		return doktori;
	}

	public void setDoktori(Set<DoktorDTO> doktori) {
		this.doktori = doktori;
	}

//	public Set<SalaDTO> getSale() {
//		return sale;
//	}
//
//	public void setSale(Set<SalaDTO> sale) {
//		this.sale = sale;
//	}
	
	
}
