package io.isaBackend.model.user;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.joda.time.DateTime;
import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

//Tabela sa svim korisnicia koju treba povezati sa authority jer svaki korisnik ima vise rola i svaku rolu moze vise authorityl
@Entity
@Table(name="Users")
@Inheritance(strategy = InheritanceType.JOINED)
public class User implements UserDetails{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "username", unique = true, nullable = false)
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "enabled")
	private boolean enabled;
	
	//@Column(name="registrationCode")
	private String registrationCode;

	@Column(name = "email")
	private String email;

	@Column(name = "last_password_reset_date")
	private Timestamp lastPasswordResetDate;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_authority",
		joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
		inverseJoinColumns = @JoinColumn(name = "authority_id", referencedColumnName = "id"))
	private List<Authority> authorities;


	public User() {
		super();
	}

	public User(String username, String password, boolean enabled, Timestamp lastPasswordResetDate,String email, String registrationCode,
			List<Authority> authorities) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.email = email;
		this.registrationCode = registrationCode;
		this.lastPasswordResetDate = lastPasswordResetDate;
		this.authorities = authorities;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		Timestamp now = new Timestamp(DateTime.now().getMillis());
		this.setLastPasswordResetDate(now);
		this.password = password;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}

	//Role svako ima 1
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return  this.authorities;
	}

	//ovde menjamo da li je enabled, tu se menja ako treba nakon potvrde na mejl da se registruje
	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Timestamp getLastPasswordResetDate() {
		return lastPasswordResetDate;
	}

	public void setLastPasswordResetDate(Timestamp lastPasswordResetDate) {
		this.lastPasswordResetDate = lastPasswordResetDate;
	}	
	


	@JsonIgnore
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//Nekom korisniku mogu da zaklucam akaunt, nama ne treba...
	@JsonIgnore
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	//Za password ako treba da se menja ovde mogu proveravati da li se menjao password, nama ne treba...
	@JsonIgnore
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getRegistrationCode() {
		return registrationCode;
	}

	public void setRegistrationCode(String registrationCode) {
		this.registrationCode = registrationCode;
	}
	


}
