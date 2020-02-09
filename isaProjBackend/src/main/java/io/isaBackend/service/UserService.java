package io.isaBackend.service;

import java.nio.file.AccessDeniedException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.access.AccessDeniedException;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import io.isaBackend.dto.UserRequest;
import io.isaBackend.model.user.Authority;
import io.isaBackend.model.user.User;
import io.isaBackend.repository.UserRepository;

//Ovo je kod iz UserServiceImplemtation klase sa vezbi
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

//	@Autowired
//	private PasswordEncoder passwordEncoder;
//
//	@Autowired
//	private AuthorityService authService;

	
	public List<User> findAll() throws AccessDeniedException {
		return userRepository.findAll();
		
	}
	
	public User findById(Long id) throws AccessDeniedException {
		return userRepository.findById(id).orElseGet(null);
	}

	
	public User findByUsername(String username) throws UsernameNotFoundException {
		return userRepository.findByUsername(username);
	}

	public User findByRegistrationCode(String registrationCode) {
		return userRepository.findByRegistrationCode(registrationCode);
	}

//	//Override nad save je uradjen kako bi se password enkriptovao
//	public User save(UserRequest userRequest) {
//		User u = new User();
//		u.setUsername(userRequest.getUsername());
//		u.setPassword(passwordEncoder.encode(userRequest.getPassword()));
//		//u.setEmail(userRequest.getE);
//		u.setEnabled(true);
//		
//		List<Authority> auth = authService.findByName("ROLE_USER");
//		u.setAuthorities(auth);
//		
//		u = this.userRepository.save(u);
//		return u;
//	}
	
}
