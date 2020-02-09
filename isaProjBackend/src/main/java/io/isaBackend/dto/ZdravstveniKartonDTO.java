package io.isaBackend.dto;

import io.isaBackend.model.report.ZdravstveniKarton;

public class ZdravstveniKartonDTO {
private Long id;
	
	private String visina;
	private String tezina;
	private String krvnaGrupa;
	private String alergija;
	private String dioptrija;
	
	
	public ZdravstveniKartonDTO() {
		
	}
	
	public ZdravstveniKartonDTO(ZdravstveniKarton zdravKarton){
		this.id = zdravKarton.getId();
		this.visina = zdravKarton.getVisina();
		this.tezina = zdravKarton.getTezina();
		this.krvnaGrupa = zdravKarton.getKrvnaGrupa();
		this.alergija = zdravKarton.getAlergija();
		this.dioptrija = zdravKarton.getDioptrija();
	}
	
	public ZdravstveniKartonDTO(Long id, String visina, String tezina, String krvnaGrupa, String alergija,
			String dioptrija) {
		super();
		this.id = id;
		this.visina = visina;
		this.tezina = tezina;
		this.krvnaGrupa = krvnaGrupa;
		this.alergija = alergija;
		this.dioptrija = dioptrija;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getVisina() {
		return visina;
	}
	public void setVisina(String visina) {
		this.visina = visina;
	}
	public String getTezina() {
		return tezina;
	}
	public void setTezina(String tezina) {
		this.tezina = tezina;
	}
	public String getKrvnaGrupa() {
		return krvnaGrupa;
	}
	public void setKrvnaGrupa(String krvnaGrupa) {
		this.krvnaGrupa = krvnaGrupa;
	}
	public String getAlergija() {
		return alergija;
	}
	public void setAlergija(String alergija) {
		this.alergija = alergija;
	}
	public String getDioptrija() {
		return dioptrija;
	}
	public void setDioptrija(String dioptrija) {
		this.dioptrija = dioptrija;
	}
}
