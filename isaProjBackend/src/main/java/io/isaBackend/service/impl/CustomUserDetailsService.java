package io.isaBackend.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import io.isaBackend.model.user.Pacijent;
import io.isaBackend.model.user.User;
import io.isaBackend.repository.PacijentRepository;
import io.isaBackend.repository.UserRepository;


@Service
public class CustomUserDetailsService implements UserDetailsService {
	protected final Log LOGGER = LogFactory.getLog(getClass());

//	@Autowired
//	private UserRepository userRepository;
	
	@Autowired
	PacijentRepository pacijentRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	//AuthenticationManager autentifikuje naseg korisnika u spring security aplikaciji.
	//pokusava da na osnovu username loudje iz baze ceo objekat i proveri da li je validan.
	//Krajnji efekat je da ja mogu nad kontrolerima staviti @PreAuthorised(hasRole()) i na osnovu rola gledati pristup.
	@Autowired
	private AuthenticationManager authenticationManager;

	// Funkcija koja na osnovu username-a iz baze vraca objekat User-a,
	//vraca UserDetails da bi mu rekao da to nije nije neki obican user, vec User iz springa
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		System.out.println("usao u customUserDetails: " + username);
		//User user = userRepository.findByUsername(username);
		Pacijent pacijent = pacijentRepository.findByUsername(username);
		if (pacijent == null) {
			throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
		} else {
			return (UserDetails) pacijent;
		}
	}
}
