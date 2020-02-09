package io.isaBackend.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.config.Projection;

import io.isaBackend.model.klinika.Klinika;
import io.isaBackend.model.klinika.Termin;

@Projection(name = "termin", types = { Termin.class })
public interface TerminRepository extends JpaRepository<Termin,Long> {

	List<Termin> getAllByDatum(LocalDate datum);
	
	//ovaj pozivam
	@Query(value = "SELECT DISTINCT k " + 
			"FROM Klinika k " + 
			"INNER JOIN Doktor d ON k.id = d.klinika.id " + 
			"INNER JOIN Termin t ON d.id = t.doktor.id " + 
			"INNER JOIN TipPregleda tp ON d.tipPregleda.id = tp.id WHERE tp.naziv = :tipPregleda AND t.datum = :datum")
    List<Klinika> findKlinikaByTipPregledaAndDatum(@Param("tipPregleda") String tipPregleda, @Param("datum") LocalDate datum);
	
}
