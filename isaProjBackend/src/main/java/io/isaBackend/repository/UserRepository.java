package io.isaBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.isaBackend.model.user.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);

	User findByRegistrationCode(String registrationCode);
}
