package io.isaBackend.model.user;

import java.sql.Timestamp;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.isaBackend.model.klinika.Klinika;

@Entity
public class AdministratorKlinike /*extends User*/ {

	private static final long serialVersionUID = 1L;

	//Obrisi kada dodas User
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "role")
	private static final String role = "clinic_administrator";

	@Column(nullable = true)
	private String ime;

	@Column(nullable = true)
	private String prezime;

	//Vise administratora klinike moze da radi u jednoj klinici.
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Klinika klinika;
	
	//obrisati nakon dodavanja user
	public AdministratorKlinike() {
		
	}

	
	public AdministratorKlinike(String username, String password, boolean enabled, Timestamp lastPasswordResetDate/*,
			List<Authority> authorities*/, String ime, String prezime) {
		/*super(username, password, enabled, lastPasswordResetDate, authorities);*/
		this.ime = ime;
		this.prezime = prezime;
	}

	public static String getRole() {
		return role;
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


	//dodato
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Klinika getKlinika() {
		return klinika;
	}


	public void setKlinika(Klinika klinika) {
		this.klinika = klinika;
	}

}
