package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.report.ZdravstveniKarton;

public interface ZdravstveniKartonRepository extends  JpaRepository<ZdravstveniKarton, Long> {

}
