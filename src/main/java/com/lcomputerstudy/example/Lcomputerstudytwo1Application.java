package com.lcomputerstudy.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class Lcomputerstudytwo1Application extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(Lcomputerstudytwo1Application.class, args);
		System.out.println("System on");
	}
	
	@Override
	protected SpringApplicationBuilder  configure(SpringApplicationBuilder  builder) {
		return builder.sources(Lcomputerstudytwo1Application.class);
	}

}
