package com.lcomputerstudy.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.SurveyService;

@org.springframework.stereotype.Controller
public class SurveyController {
	@Autowired SurveyService surveyservice;
	
	
	@RequestMapping("/survey/question")
	public String question() {
		return "/survey/question";
	}
	
	@RequestMapping("/survey/adjust/process")
	public String surveyAdjustProcess(Model model, @RequestBody Survey survey) {
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		survey.setUser(user);
		System.out.println("GET DATA: " +survey);
		surveyservice.saveSurvey(survey);
		
		
		
		return "/survey/question";
	}
	
}
