package com.lcomputerstudy.example.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.ResSurvey;
import com.lcomputerstudy.example.domain.Result;
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
		List<Survey> list = surveyservice.surveyList();
		model.addAttribute("list", list);
		return "/survey/surveyList";
	}
	
	@RequestMapping("/survey/response/{sIdx}")
	public String surveyResponse(Survey survey, Model model) {				
		Survey sv = surveyservice.respondSurvey(survey);		
		model.addAttribute("survey", sv);
		return "/survey/response";
	}
	@RequestMapping("/survey/response/process") 
		public String surveyResponseProcess(@RequestBody ResSurvey resSurvey) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		resSurvey.setUser(user);
		System.out.println(resSurvey);
		surveyservice.saveResponse(resSurvey);
			return "/survey/surveyList";
		}
	
	@RequestMapping("/survey/response/static/{sIdx}")
	public String surveyStatic(Survey survey) {
		System.out.println(survey);
		
		List<Result> resultList = surveyservice.getResult(survey);
		HashMap<Integer, List<Result>> map = new HashMap<>();
		List<Result> list;
		Result result;
		
		System.out.println(resultList);
		
		int key = resultList.get(0).getrIndex();
		
		for(int i = 1; i < resultList.size(); i++) {	
			  if(key == resultList.get(i).getrIndex()) {
				  resultList.remove(i);
				  i--;
			  } else {
				  key = resultList.get(i).getrIndex();
			  }	  
		}
		for(int j = 0; j < resultList.size(); j++) {   		
			if(resultList.get(j).getqType().equals("long")) {
				resultList.remove(j);
				j--;	   			   
	   		}  
		}
		for(int i = 0; i < resultList.size(); i++) {
	   		   list = new ArrayList<>();
	   		   for(int j = 0; j < resultList.size(); j++) {
	   			   if(resultList.get(i).getrIndex() == resultList.get(j).getrIndex()) {
	   				   result = new Result();   				  
	   				   result.setCount(resultList.get(j).getCount());
	   				   result.setContent(resultList.get(j).getContent());
	   				   result.setrIndex(resultList.get(j).getrIndex());
	   				   list.add(result);
	   			   }
	   		   }
	   		   
	   		   map.put(resultList.get(i).getrIndex(), list);   
	   	   }   	   
	   	   	 
	       System.out.println("MAP: " + map);		
	       return "/survey/static";
	}
	
}
