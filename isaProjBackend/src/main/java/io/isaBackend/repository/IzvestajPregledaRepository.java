package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.report.IzvestajPregleda;

public interface IzvestajPregledaRepository extends JpaRepository<IzvestajPregleda, Long> {

}
