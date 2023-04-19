package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired SurveyMapper surveymapper;
	
	@Override
	public void saveSurvey(Survey survey) {
		surveymapper.saveSurvey(survey);		
		
		for(Question q: survey.getQuestions()) {
			q.setsIdx(survey.getsIdx());
			surveymapper.saveQuestion(q);
			surveymapper.saveItem(q);				
		}
	}		
	@Override
	public List<Survey> selectSurvey() {
		return surveymapper.selectSurvey();
	}
	
	@Override
	public Survey respondSurvey(Survey survey) {
		Survey resultSurvey = surveymapper.getSurvey(survey);
		resultSurvey.setQuestions(surveymapper.getQuestions(survey));
		resultSurvey.setItems(surveymapper.getItems(survey));
		
		return resultSurvey;
	}
}
