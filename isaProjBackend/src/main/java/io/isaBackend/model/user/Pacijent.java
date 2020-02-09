package io.isaBackend.model.user;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.klinika.Pregled;
//import io.isaBackend.model.klinika.Operacija;
//import io.isaBackend.model.klinika.Pregled;
import io.isaBackend.model.report.ZdravstveniKarton;

@Entity
public class Pacijent extends User{

	private static final long serialVersionUID = 1L;

	//Obrisi kada dodas User
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id;
	
	@Column(name = "role")
	private static final String role = "pacijent";

	@Column(name = "first_name", nullable = false)
	private String ime;

	@Column(name = "last_name", nullable = false)
	private String prezime;

	@Column(name = "address", nullable = false)
	private String adresa;

	@Column(name = "city", nullable = false)
	private String grad;

	@Column(name = "country", nullable = false)
	private String drzava;

	@Column(name = "phone_number", nullable = false)
	private String brojTelefona;

	@Column(name = "insurance_number", unique = true, nullable = false)
	private long brojOsiguranika;

//	//Jedan pacijent moze da ode na vise pregleda (u tabeli pregledu se cuva id pacijenta na kojem se vrsi pregled)
	@JsonManagedReference
	@OneToMany(mappedBy="pacijent",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	Set<Pregled> pregled = new HashSet<Pregled>();
	
	//Jedan pacijent moze da ode na vise opracija (u tabeli operacija se cuva id pacijenta na kojem se ona vrsi)
	
	@OneToMany(mappedBy="pacijent",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	Set<Operacija> operacija = new HashSet<Operacija>();
	
	@OneToOne(fetch = FetchType.LAZY)
	private ZdravstveniKarton zdravstveniKarton;
	
//	@OneToOne(fetch = FetchType.LAZY)
//	private User user;
	
	public Pacijent() {
		super();
	}

	public Pacijent(String username, String password, boolean enabled, Timestamp lastPasswordResetDate,
			List<Authority> authorities, String ime, String prezime, String adresa, String grad, String drzava,String generatedCode, String email,
			String brojTelefona, long brojOsiguranika) {
		super(username, password, enabled, lastPasswordResetDate,generatedCode, email, authorities);
		this.ime = ime;
		this.prezime = prezime;
		this.adresa = adresa;
		this.grad = grad;
		this.drzava = drzava;
		this.brojTelefona = brojTelefona;
		this.brojOsiguranika = brojOsiguranika;
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

//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}

	public Set<Pregled> getPregled() {
		return pregled;
	}
	
//	public void setPregledById(Long id, Pregled pregled) {
//		
//	}

	public void setPregled(Set<Pregled> pregled) {
		this.pregled = pregled;
	}

	public Set<Operacija> getOperacija() {
		return operacija;
	}

	public void setOperacija(Set<Operacija> operacija) {
		this.operacija = operacija;
	}

	public ZdravstveniKarton getZdravstveniKarton() {
		return zdravstveniKarton;
	}

	public void setZdravstveniKarton(ZdravstveniKarton zdravstveniKarton) {
		this.zdravstveniKarton = zdravstveniKarton;
	}

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}
	
}
