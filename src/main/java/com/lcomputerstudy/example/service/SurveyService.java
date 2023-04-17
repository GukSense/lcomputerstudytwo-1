package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.domain.User;

public interface SurveyService {
	
	public void saveSurvey(Survey survey);
	
	public List<Survey> selectSurvey(User user);
	
	
	
}
