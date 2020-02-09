package io.isaBackend.model.user;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.report.Recept;
//import io.isaBackend.model.report.Recept;


@Entity
public class MedicinskaSestra {

	private static final long serialVersionUID = 1L;

	//Obrisi kad dodas user 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "role")
	private static final String role = "nurse";

	@Column(nullable = false)
	private String ime;

	@Column( nullable = false)
	private String prezime;

	@JsonIgnore
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Klinika klinika;
	
	//Jedna medicinska sestra moze da se potpise na vise recepata. id sestre se cuva u tabeli recept
	
	@JsonManagedReference
	@OneToMany(mappedBy="medSestra", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Recept> recept;
	
	public MedicinskaSestra() {}

	public MedicinskaSestra(String username, String password, boolean enabled, Timestamp lastPasswordResetDate,
			/*List<Authority> authorities,*/ String ime, String prezime) {
//		super(username, password, enabled, lastPasswordResetDate, authorities);
		this.ime = ime;
		this.prezime = prezime;
	}

	public static String getRole() {
		return role;
	}

	//dodato
	
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

	public Set<Recept> getRecept() {
		return recept;
	}

	public void setRecept(Set<Recept> recept) {
		this.recept = recept;
	}
	
	
	

}
