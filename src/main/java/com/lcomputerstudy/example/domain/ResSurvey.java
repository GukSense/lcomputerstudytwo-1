package com.lcomputerstudy.example.domain;

import java.util.List;

public class ResSurvey {
	private int sIdx;
	private List<ResAnswer> resAnswers;
	private User user;
	private String sName;	//user name 
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public List<ResAnswer> getAnswers() {
		return resAnswers;
	}
	public void setAnswers(List<ResAnswer> resAnswers) {
		this.resAnswers = resAnswers;
	}
	@Override
	public String toString() {
		return "ResSurvey [sIdx=" + sIdx + ", answers=" + resAnswers + ", user=" + user + ", sName=" + sName + "]";
	}
	
	
	
}
