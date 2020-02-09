package io.isaBackend.dto;

import io.isaBackend.model.user.MedicinskaSestra;

public class MedicinskaSestraDTO {

	private String role;

	private Long id;
//	private String username;
//	private String password;
	private String ime;
	private String prezime;
	
	//klinika
	//recept

	public MedicinskaSestraDTO() {
		
	}
	
	public MedicinskaSestraDTO(String role, Long id/*, String username, String password*/, String ime, String prezime) {
		this.role = role;
		this.id = id;
//		this.username = username;
//		this.password = password;
		this.ime = ime;
		this.prezime = prezime;

	}

	public MedicinskaSestraDTO( MedicinskaSestra medSestra) {
		this.role = medSestra.getRole();
		this.id = medSestra.getId();
//		this.username = medSestra.getUsername();
//		this.password = medSestra.getPassword();
		
		this.ime = medSestra.getIme();
		this.prezime = medSestra.getPrezime();

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

	public void setId(Long id) {
		this.id = id;
	}

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
	
	
	
}
