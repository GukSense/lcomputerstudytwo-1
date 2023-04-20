package com.lcomputerstudy.example.controller;


import java.util.List;

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
		surveyservice.saveSurvey(survey);		
		
		return "/survey/question";
	}
	
	@RequestMapping("/survey/surveyList")
	public String surveyList(Model model) {
		List<Survey> list = surveyservice.selectSurvey();
		model.addAttribute("list", list);
		return "/survey/surveyList";
	}
	
	@RequestMapping("/survey/response/{sIdx}")
	public String surveyResponse(Survey survey, Model model) {		
		System.out.println("SIDX: " + survey.getsIdx());
		Survey sv = surveyservice.respondSurvey(survey);
		System.out.println("SURBEY: " + sv);
		model.addAttribute("survey", sv);
		return "/survey/response";
	}
}
