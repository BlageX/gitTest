package io.isaBackend.security.auth;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {

	//Metoda koja se izvrsava ukoliko neautorizovani korisnik pokusa da pristupi zasticenom REST servisu
	//Metoda vraca 401 Unauthorized response, ukoliko postoji Login Page u aplikaciji, pozeljno je da se korisnik redirektuje na tu stranicu
    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
    	System.out.println("Usao u RestAuthentificationEntryPoint!");
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, authException.getMessage());
    }
}

