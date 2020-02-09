package io.isaBackend.dto;

import  io.isaBackend.dto.ZdravstveniKartonDTO;

import io.isaBackend.model.report.ZdravstveniKarton;
import io.isaBackend.model.user.Pacijent;

public class PacijentDTO {

	private String role;

	private Long id;
//	private String username;
//	private String password;
	private String ime;
	private String prezime;
	private String adresa;
	private String grad;
	private String drzava;
	private String brojTelefona;
	private long brojOsiguranika;
	
	private ZdravstveniKartonDTO zdravstveniKarton;

	public PacijentDTO() {
		
	}
	
	public PacijentDTO(String role, Long id,/* String username, String password,*/ String ime, String prezime,
			String adresa, String grad, String drzava, String brojTelefona, long brojOsiguranika/*, ZdravstveniKartonDTO zdravstveniKarton*/) {
		this.role = role;
		this.id = id;
//		this.username = username;
//		this.password = password; //trebace password
		this.ime = ime;
		this.prezime = prezime;
		this.adresa = adresa;
		this.grad = grad;
		this.drzava = drzava;
		this.brojTelefona = brojTelefona;
		this.brojOsiguranika = brojOsiguranika;
		this.zdravstveniKarton = zdravstveniKarton;
	}

	public PacijentDTO(Pacijent pacijent) {
		this.role = pacijent.getRole();
		this.id = pacijent.getId();
//		this.username = patient.getUsername();
//		this.password = patient.getPassword();
		this.ime= pacijent.getIme();
		this.prezime = pacijent.getPrezime();
		this.adresa = pacijent.getAdresa();
		this.grad = pacijent.getGrad();
		this.drzava = pacijent.getDrzava();
		this.brojTelefona = pacijent.getBrojTelefona();
		this.brojOsiguranika = pacijent.getBrojOsiguranika();
		this.zdravstveniKarton = new ZdravstveniKartonDTO(pacijent.getZdravstveniKarton());
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getPassword() {
//		return password;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}

	public String getIme() {
		return ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPrezime() {
		return prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getGrad() {
		return grad;
	}

	public void setGrad(String grad) {
		this.grad = grad;
	}

	public String getDrzava() {
		return drzava;
	}

	public void setDrzava(String drzava) {
		this.drzava = drzava;
	}

	public String getBrojTelefona() {
		return brojTelefona;
	}

	public void setBrojTelefona(String brojTelefona) {
		this.brojTelefona = brojTelefona;
	}

	public long getBrojOsiguranika() {
		return brojOsiguranika;
	}

	public void setBrojOsiguranika(long brojOsiguranika) {
		this.brojOsiguranika = brojOsiguranika;
	}

	public ZdravstveniKartonDTO getZdravstveniKarton() {
		return zdravstveniKarton;
	}

	public void setZdravstveniKarton(ZdravstveniKartonDTO zdravstveniKarton) {
		this.zdravstveniKarton = zdravstveniKarton;
	}
}
