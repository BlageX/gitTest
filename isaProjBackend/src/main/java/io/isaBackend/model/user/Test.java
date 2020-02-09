package io.isaBackend.model.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Test extends User{
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private long id;
//	
	@Column
	private String naziv;
	
	public Test() {}

	public Test(String naziv) {
		super();
		this.naziv = naziv;
	}

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	
}
