package io.isaBackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.klinika.TipPregleda;

public interface TipPregledaRepository extends  JpaRepository<TipPregleda,Long> {

	List<TipPregleda> findAllByKlinikeId(Long klinika_id);

}
