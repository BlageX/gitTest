package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.report.Recept;

public interface ReceptRepository extends JpaRepository<Recept, Long>{
	
}
