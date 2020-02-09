package io.isaBackend.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import io.isaBackend.model.user.User;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	/*
	 * Koriscenje klase za ocitavanje vrednosti iz application.properties fajla
	 */
	@Autowired
	private Environment env;

	/*
	 * Anotacija za oznacavanje asinhronog zadatka
	 * Vise informacija na: https://docs.spring.io/spring/docs/current/spring-framework-reference/integration.html#scheduling
	 */
	@Async
	public void sendNotificaitionAsync(User user) throws MailException, InterruptedException {
		
		//Simulacija duze aktivnosti da bi se uocila razlika
		//Thread.sleep(10000);
		System.out.println("Slanje emaila...");
		
		
//		System.out.println("gmail na koji saljem: " + user.getEmail());
//		System.out.println("gmail sa kojeg saljem: " + env.getProperty("spring.mail.username"));
		 
		String poruka = "Pozdrav " + user.getUsername() + ",\n\n hvala Vam na registraciji. Molimo Vas kliniknite na link ispod da biste aktivirali vas nalog!\n\n";
		String url = "/login?token=" + user.getRegistrationCode();
		
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo(user.getEmail());
		mail.setFrom(env.getProperty("spring.mail.username"));
		mail.setSubject("Mejl sa linkom za registraciju");
		mail.setText(poruka+ "http://localhost:8081" + url);
		javaMailSender.send(mail);

		System.out.println("Email poslat!");
	}
	
	
	
	
}