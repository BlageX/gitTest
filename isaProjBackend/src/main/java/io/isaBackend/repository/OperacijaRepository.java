package io.isaBackend.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.klinika.Operacija;
import io.isaBackend.model.user.Doktor;

public interface OperacijaRepository extends  JpaRepository<Operacija,Long>{
	Set<Doktor> findByDoktoriId(Long doktor_id);
}
