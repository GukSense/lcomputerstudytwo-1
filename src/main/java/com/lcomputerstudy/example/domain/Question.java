package com.lcomputerstudy.example.domain;

import java.util.List;

public class Question {
	private int qIdx;
	private String qType;
	private String qTitle;
	private Survey survey;
	private List<item> items;
	
	
	
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public Survey getSurvey() {
		return survey;
	}
	public void setSurvey(Survey survey) {
		this.survey = survey;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public List<item> getItems() {
		return items;
	}
	public void setItems(List<item> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Question [qType=" + qType + ", qTitle=" + qTitle + ", items=" + items + "]";
	}
	
	
	
	
	
}
