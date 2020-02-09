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
//import io.isaBackend.model.user.Doktor;
//
//@Entity
//public class RadnaNedelja {
//
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id;
//	
////	private HashMap<String, Dan> nedeljniRaspored;
//	
//	public RadnaNedelja() {
////		nedeljniRaspored = new HashMap<String,Dan>();
//	}
//	
//	@OneToMany(mappedBy = "radnaNedelja", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	private Set<Doktor> doktor;
//	
//	//jedna radna nedelja ima vise radnih dana (sa istim rasporedom terminima)	
//	@ManyToMany
//	@JoinTable(joinColumns = @JoinColumn(name = "radna_nedelja_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "dan_id", referencedColumnName = "id"))
//	private Set<Dan> dani = new HashSet<Dan>();
//
//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public Set<Doktor> getDoktor() {
//		return doktor;
//	}
//
//	public void setDoktor(Set<Doktor> doktor) {
//		this.doktor = doktor;
//	}
//
//	public Set<Dan> getDani() {
//		return dani;
//	}
//
//	public void setDani(Set<Dan> dani) {
//		this.dani = dani;
//	}
//	
//	
//}
