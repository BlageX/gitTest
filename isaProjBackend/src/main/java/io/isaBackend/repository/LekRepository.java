package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.report.Lek;

public interface LekRepository extends JpaRepository<Lek, Long> {

}
