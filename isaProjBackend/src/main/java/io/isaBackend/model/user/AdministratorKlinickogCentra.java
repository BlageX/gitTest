package io.isaBackend.model.user;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AdministratorKlinickogCentra /* extends User */ {

	private static final long serialVersionUID = 1L;

	//Obrisi kada dodas User
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "role")
	private static final String role = "clinic_center_administrator";

	public AdministratorKlinickogCentra() {
		
	}
	
	public AdministratorKlinickogCentra(String username, String password, boolean enabled, Timestamp lastPasswordResetDate/*,
			List<Authority> authorities*/) {
		/*super(username, password, enabled, lastPasswordResetDate, authorities);*/
	}
	
	

	public static String getRole() {
		return role;
	}
	

	//dodato

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}	

}
