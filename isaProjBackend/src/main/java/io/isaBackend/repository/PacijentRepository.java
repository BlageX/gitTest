package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.user.Pacijent;

public interface PacijentRepository extends JpaRepository<Pacijent, Long> {
	Pacijent findByUsername(String username);
}
