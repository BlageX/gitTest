package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.report.Dijagnoza;

public interface DijagnozaRepository extends JpaRepository<Dijagnoza, Long> {
	
}
