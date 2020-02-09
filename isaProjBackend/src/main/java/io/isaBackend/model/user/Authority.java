package io.isaBackend.model.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

//import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonIgnore;

//Tabela sa id i nazivom role: pacijent,admin...
@Entity
public class Authority implements GrantedAuthority {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column
	private String name;

	
	
public Authority() {}
	
public Authority(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public String getAuthority() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

//	@JsonIgnore
	public String getName() {
		return name;
	}

	//@JsonIgnore
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
