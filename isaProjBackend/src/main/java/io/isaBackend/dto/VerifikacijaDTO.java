package io.isaBackend.dto;

import javax.validation.constraints.NotNull;

public class VerifikacijaDTO {
	
	@NotNull
	private String registrationCode;

	public VerifikacijaDTO() {}


	public VerifikacijaDTO(@NotNull String registrationCode) {
		super();
		this.registrationCode = registrationCode;
	}



	public String getRegistrationCode() {
		return registrationCode;
	}

	public void setRegistrationCode(String registrationCode) {
		this.registrationCode = registrationCode;
	}
	
	


	
}
