package com.lcomputerstudy.example.domain;

import java.util.List;

public class Survey {
	private String sTitle;
	private String sDescription;
	private int sIdx; 
	private String sDateTime;
	private User user;
	
	private List<Question> questions;
	
	
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getsDateTime() {
		return sDateTime;
	}
	public void setsDateTime(String sDateTime) {
		this.sDateTime = sDateTime;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDescription() {
		return sDescription;
	}
	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
	@Override
	public String toString() {
		return "Survey [sTitle=" + sTitle + ", sDescription=" + sDescription + ", sIdx=" + sIdx + ", sDateTime="
				+ sDateTime + ", user=" + user + ", questions=" + questions + "]";
	}
	
	
	
	
}
