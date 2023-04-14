package com.lcomputerstudy.example.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.domain.User;

@org.springframework.stereotype.Controller
public class SurveyController {
	
	
	
	@RequestMapping("/survey/question")
	public String question() {
		return "/survey/question";
	}
	
	@RequestMapping("/survey/adjust/process")
	public String surveyAdjustProcess(Model model, @RequestBody Survey survey) {
		//User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		return "/survey/question";
	}
	
}
