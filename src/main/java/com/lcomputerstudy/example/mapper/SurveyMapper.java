package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Survey;

@Mapper
public interface SurveyMapper {
	
	public List<Survey> surveyList();
	
	public void saveSurvey(Survey survey);
	public void saveQuestion(Question question);
	public void saveItem(Question question);
	
	public Survey getSurvey(Survey survey);
	public List<Question> getQuestions(Survey survey);
	public List<Item> getItems(Question question);		

	public void saveResponseSurvey(Survey survey);
	public void saveResponseQuestion(Question question);
	public void saveResponseItem(Question question);
	public void updateRespondent(Survey survey);
	
}
