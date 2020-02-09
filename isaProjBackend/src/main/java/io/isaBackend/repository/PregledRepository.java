package io.isaBackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import io.isaBackend.model.klinika.Pregled;

public interface PregledRepository extends JpaRepository<Pregled,Long> {
	List<Pregled> findAllByKlinikaId(Long id);

	List<Pregled> findAllByPacijentId(Long pacijent_id);
}
