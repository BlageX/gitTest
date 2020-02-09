package io.isaBackend.dto;

import javax.persistence.Column;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.user.AdministratorKlinike;


public class AdministratorKlinikeDTO {

	private Long id; 
//	private String username;
//	private String password;
	private String ime;
	private String prezime;
	private KlinikaDTO klinika;
	
	public AdministratorKlinikeDTO() {
		
	}
	
	public AdministratorKlinikeDTO(AdministratorKlinike adminKlinike) {
		this.id =  adminKlinike.getId();
		this.ime = adminKlinike.getIme();
		this.prezime = adminKlinike.getPrezime();
		this.klinika = new KlinikaDTO(adminKlinike.getKlinika()); 
		/*,adminKlinike.getUsername(),adminKlinike.getPassword()*/
	}
	
	public AdministratorKlinikeDTO(Long id, String ime, String prezime,KlinikaDTO klinika/*, String username, String password*/) {
		super();
		this.id = id;
		this.ime = ime;
		this.prezime = prezime;
		this.klinika = klinika;
		
//		this.username = username;
//		this.password = password;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
//	public String getUsername() {
//		return username;
//	}
//	public void setUsername(String username) {
//		this.username = username;
//	}
//	public String getPassword() {
//		return password;
//	}
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

	public KlinikaDTO getKlinika() {
		return klinika;
	}

	public void setKlinika(KlinikaDTO klinika) {
		this.klinika = klinika;
	}
	
	
	
}
