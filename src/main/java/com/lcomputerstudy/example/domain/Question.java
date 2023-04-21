package com.lcomputerstudy.example.domain;

import java.util.List;

public class Question {
	private int qIdx;
	private String qType;
	private String qTitle;
	private int sIdx;
	
	List<Item> items;
	
	
	
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
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
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Question [qIdx=" + qIdx + ", qType=" + qType + ", qTitle=" + qTitle + ", sIdx=" + sIdx + ", items="
				+ items + "]";
	}
	
	
	
	
	
	
	
}
