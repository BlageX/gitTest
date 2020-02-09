package io.isaBackend;

import org.joda.time.Days;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.text.SimpleDateFormat;  
import java.util.Date;  

@SpringBootApplication
@EnableAsync
@EnableScheduling
public class IsaProjBackendApplication {

	public static void main(String[] args) throws ParseException {
		SpringApplication.run(IsaProjBackendApplication.class, args);
		
		 String str1 = "15/03/2020";
		 String str2 = "20/03/2020";
		//String str = searchedKlinikaRequestDTO.getDatum();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		
		LocalDate date1 = LocalDate.parse(str1, formatter);;
		LocalDate date2 = LocalDate.parse(str2, formatter);;

		LocalDate dateOtkazivanja = LocalDate.now();
		System.out.println("dateOtkazivanja: " + dateOtkazivanja);
		
		
		int days = (int) ChronoUnit.DAYS.between(date1, date2);
		System.out.println("days between: " + days);
		
		
//		String sDate1="31/12/1998";  
//		String sDate2 = "31-Dec-1998";  
//		String sDate3 = "12 31, 1998";  
//		String sDate4 = "Fri, Dec 31 1998";  
//		String sDate5 = "Thu, Dec 31 1998 23:37:50";  
//		String sDate6 = "31-Dec-1998 23:37:50";  
//		SimpleDateFormat formatter1=new SimpleDateFormat("dd/MM/yyyy");  
//		SimpleDateFormat formatter2=new SimpleDateFormat("dd-MMM-yyyy");  
//		SimpleDateFormat formatter3=new SimpleDateFormat("MM dd, yyyy");  
//		SimpleDateFormat formatter4=new SimpleDateFormat("E, MMM dd yyyy");  
//		SimpleDateFormat formatter5=new SimpleDateFormat("E, MMM dd yyyy HH:mm:ss");  
//		SimpleDateFormat formatter6=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
//		Date date1=formatter1.parse(sDate1);  
//		Date date2=formatter2.parse(sDate2);  
//		Date date3=formatter3.parse(sDate3);  
//		Date date4=formatter4.parse(sDate4);  
//		Date date5=formatter5.parse(sDate5);  
//		Date date6=formatter6.parse(sDate6);  
//		System.out.println(sDate1+"\t"+date1);  
//		System.out.println(sDate2+"\t"+date2);  
//		System.out.println(sDate3+"\t"+date3);  
//		System.out.println(sDate4+"\t"+date4);  
//		System.out.println(sDate5+"\t"+date5);  
//		System.out.println(sDate6+"\t"+date6);  
		
//	    long endDate = new SimpleDateFormat("dd.MM.yyyy").parse("9.02.2020").getTime();
//	    long now = System.currentTimeMillis();
//	    String result = null;
//	    //long diff = Math.abs(t1-now);
		
//		System.out.println("Current date: " + myObjDate); // Display the current date
//		System.out.println("Current time: " + myObjTime); // Display the current date
//		Days.between(startDate, endDate);
		
		
		
	}
}




