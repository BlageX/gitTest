//package io.isaBackend.model.klinika;
//
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
//import javax.persistence.OneToMany;
//
//@Entity
//public class Dan {
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id;
//	
//	private String nazivDana;
//	
//	//jedan radni dan ima vise termina
//	@ManyToMany
//	@JoinTable(joinColumns = @JoinColumn(name = "dan_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "termin_id", referencedColumnName = "id"))
//	private Set<Termin> termini = new HashSet<Termin>();
//	
//	
//	//jedna radni dan(sa istim rasporedom terminima) moze biti u vise nedelja (npr. svaki ponedeljak je isti)
//	@ManyToMany(mappedBy="dani") 
//	private Set<RadnaNedelja> radnaNedelja = new HashSet<RadnaNedelja>();
//	
//	// KONSTRUKTOR
//	public Dan() {
//		nazivDana = "";
//	}
//	
//	//---------------------
//	
//	
//	public String getNazivDana() {
//		return nazivDana;
//	}
//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public Set<Termin> getTermini() {
//		return termini;
//	}
//
//	public void setTermini(Set<Termin> termini) {
//		this.termini = termini;
//	}
//
//	public Set<RadnaNedelja> getRadnaNedelja() {
//		return radnaNedelja;
//	}
//
//	public void setRadnaNedelja(Set<RadnaNedelja> radnaNedelja) {
//		this.radnaNedelja = radnaNedelja;
//	}
//
//	public void setNazivDana(String nazivDana) {
//		this.nazivDana = nazivDana;
//	}
//		
//
//}