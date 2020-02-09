package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.user.MedicinskaSestra;

public interface MedicinskaSestraRepository extends JpaRepository<MedicinskaSestra, Long>  {

}
