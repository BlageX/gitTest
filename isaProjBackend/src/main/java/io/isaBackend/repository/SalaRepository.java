package io.isaBackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.klinika.Sala;

public interface SalaRepository extends JpaRepository<Sala,Long>{

	List<Sala> findAllByKlinikaId(Long klinika_id);

}
