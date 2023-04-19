package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.domain.User;

@Mapper
public interface SurveyMapper {
	
	public List<Survey> selectSurvey();
	
	public void saveSurvey(Survey survey);
	public void saveQuestion(Question question);
	public void saveItem(Question question);
	
}
