package io.isaBackend.dto;

import io.isaBackend.model.user.User;

//Kao DTO za USERA sta saljemo u formi kao podatke prilikom logovanja mada za to sluzi i klasa JwtAuthentificationRequest pa se ova moze i obrisati...
public class UserRequest {

	private Long id;

	private String username;

	private String password;
	
//	private String email;
//	private StampDate stamp;
	
	//ja dodao
	public UserRequest() {}
	
	public UserRequest(User u) {
		this.id = u.getId();
		this.username = u.getUsername();
		this.password = u.getPassword();
	}

	public UserRequest(Long id, String username, String password, String firstname, String lastname) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	
	//--dovde

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
