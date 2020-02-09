package io.isaBackend.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import io.isaBackend.security.auth.RestAuthenticationEntryPoint;
import io.isaBackend.security.auth.TokenAuthenticationFilter;
import io.isaBackend.security.security.TokenUtils;
import io.isaBackend.service.impl.CustomUserDetailsService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.afterburner.AfterburnerModule;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true) //ovo nam omogucava da se na kotrolerima lepi @PreOuthorised i provera rola;
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	// Implementacija PasswordEncoder-a koriscenjem BCrypt hashing funkcije.
	// BCrypt po defalt-u radi 10 rundi hesiranja prosledjene vrednosti.
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	//Zato sto ce se ona njegova metoda loadByUsername stalno trigerovati da pita za prava;
	@Autowired
	private CustomUserDetailsService jwtUserDetailsService;

	// Neautorizovani pristup zastcenim resursima (univerzalni exception handler)
	@Autowired
	private RestAuthenticationEntryPoint restAuthenticationEntryPoint;

	//AuthetnicationManager nam radi auntentifikaciju, dovoljno ga samo injekotvati.
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	

	

	// Definisemo nacin autentifikacije
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(jwtUserDetailsService).passwordEncoder(passwordEncoder());
	}

	@Autowired
	TokenUtils tokenUtils;

	// Definisemo prava pristupa odredjenim URL-ovima
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
				// komunikacija izmedju klijenta i servera je stateless
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()

				// za neautorizovane zahteve posalji 401 gresku onu RestAuthenticationEntryPoint iz security.auth
				.exceptionHandling().authenticationEntryPoint(restAuthenticationEntryPoint).and()

				// svim korisnicima dopusti da pristupe putanjama /**, /h2-console/** i /api/foo
				.authorizeRequests().antMatchers("/**").permitAll().antMatchers("/h2-console/**").permitAll().antMatchers("/auth/login").permitAll() 
				
				// svaki zahtev mora biti autorizovan !!! A to definisem kod same metode u kontroleru sa @PreAuthorize(pa rola);
				.anyRequest().authenticated().and()
				
				//ovaj cors() je za webConfig klasu
				.cors().and().headers().frameOptions().sameOrigin().and() //dodao kako bi H2-console bilo prikazano

				// presretni svaki zahtev filterom, rekli da pre basic autenifikacionog filtera prvo ovaj nas custom (za tokene) potera.
				.addFilterBefore(new TokenAuthenticationFilter(tokenUtils, jwtUserDetailsService),
						BasicAuthenticationFilter.class);

		http.csrf().disable(); //disejblujemo kada koristimo tokene, da kada neko drugi salje zahtev sa nase ulogovane sesije. 
	}

	// Generalna bezbednost aplikacije ovde stavljamo sta sve, svi korisnici  mogu.
	@Override
	public void configure(WebSecurity web) throws Exception {
		// TokenAuthenticationFilter ce ignorisati sve ispod navedene putanje
		web.ignoring().antMatchers(HttpMethod.POST, "/auth/login");//svako moze da se registurje ovo je bilo dodato opciono...
		web.ignoring().antMatchers(HttpMethod.GET, "/", "/webjars/**", "/*.html", "/favicon.ico", "/**/*.html",
				"/**/*.css", "/**/*.js");
	}

}
