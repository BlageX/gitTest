package io.isaBackend.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import io.isaBackend.model.user.Doktor;

public interface DoktorRepository extends  JpaRepository<Doktor, Long>{

	//Vrati listu doktora koji rade na operaciji sa datim id;
	List<Doktor> findAllByOperacijaId(Long id);
	
	
	//Vrati listu doktora koji rade u klinici sa datim id;
	List<Doktor> findAllByKlinikaId(Long id);

//	//Vrati listu doktora koji rade na operaciji sa datim id;
//	List<Doktor> findAllByOperacijaId(Long id);
		
	//Vrati listu doktora koji rade sa tipom pregleda sa datim nazivom;
	List<Doktor> findAllByTipPregledaNaziv(String tipPregleda);

	
	@Query(value = "SELECT DISTINCT d " + 
			"FROM Doktor d " + 
			"INNER JOIN Termin t ON d.id = t.doktor.id " + 
			"INNER JOIN TipPregleda tp ON d.tipPregleda.id = tp.id WHERE d.klinika.id = :klinikaId AND tp.naziv = :tipPregleda AND t.datum = :datum")
   List<Doktor> findDoktorByKlinikaIdAndTipPregledaAndDatum(@Param("klinikaId") Long klinikaId, @Param("tipPregleda") String tipPregleda, @Param("datum") LocalDate datum);


	@Query(value = "SELECT DISTINCT d " + 
			"FROM Doktor d " + 
			"WHERE d.klinika.id = :klinikaId AND d.ime = :ime")
   List<Doktor> findDoktorByKlinikaIdAndIme(@Param("klinikaId") Long klinikaId, @Param("ime") String ime);
	
	
	@Query(value = "SELECT DISTINCT d " + 
			"FROM Doktor d " + 
			"WHERE d.klinika.id = :klinikaId AND d.prezime = :prezime")
   List<Doktor> findDoktorByKlinikaIdAndPrezime(@Param("klinikaId") Long klinikaId, @Param("prezime") String prezime);
	
	@Query(value = "SELECT DISTINCT d " + 
			"FROM Doktor d " + 
			"WHERE d.klinika.id = :klinikaId AND d.ime = :ime AND d.prezime = :prezime")
   List<Doktor> findDoktorByKlinikaIdAndImeAndPrezime(Long klinikaId, @Param("ime") String ime, @Param("prezime") String prezime);
	
	
	@Query(value = "SELECT DISTINCT d " + 
			"FROM Doktor d " + 
			"WHERE d.klinika.id = :klinikaId AND d.ocena = :prosecnaOcena")
   List<Doktor> findDoktorByKlinikaIdAndProsOcena(Long klinikaId, @Param("prosecnaOcena") String prosecnaOcena);
	
	
	
	Doktor findDoktorByTerminiId(Long termin_id);
}
