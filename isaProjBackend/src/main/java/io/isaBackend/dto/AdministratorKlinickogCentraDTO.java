package io.isaBackend.dto;

import javax.persistence.Column;

import io.isaBackend.model.user.AdministratorKlinickogCentra;


public class AdministratorKlinickogCentraDTO {
	
	private Long id;
//	private String username;
//	private String password;
	
	public AdministratorKlinickogCentraDTO() {
		
	}
	
	public AdministratorKlinickogCentraDTO(AdministratorKlinickogCentra adminKlinCentra) {
		this(adminKlinCentra.getId() /*,adminKlinCentra.getUsername(),adminKlinCentra.getPassword()*/);
	}
	
	
	public AdministratorKlinickogCentraDTO(Long id	/*, String username, String password*/) {
		super();
		this.id = id;
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
}
