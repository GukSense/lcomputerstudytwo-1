package com.lcomputerstudy.example.controller;


import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class SurveyController {
	
	
	
	@RequestMapping("/survey/question")
	public String question() {
		return "/survey/question";
	}
	
	
}
