package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.user.AdministratorKlinike;;

public interface AdministratorKlinikeRepository extends JpaRepository<AdministratorKlinike, Long> {

}
