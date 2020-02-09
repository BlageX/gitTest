package io.isaBackend.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.afterburner.AfterburnerModule;


@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
	
	
	@Bean
	  // @Primary
	   public ObjectMapper objectMapper() {
	       final ObjectMapper objectMapper = new ObjectMapper();
	       objectMapper.registerModule(new JavaTimeModule());
	       objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
	       // support for Hibernate types
	       objectMapper.registerModule(new Hibernate5Module());
	       // Jackson Afterburner module to speed up ser/des
	       objectMapper.registerModule(new AfterburnerModule());
	       return objectMapper;
	   }
 
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedOrigins("http://localhost:8081").allowedMethods("PUT","DELETE","POST","GET");
    }
}
