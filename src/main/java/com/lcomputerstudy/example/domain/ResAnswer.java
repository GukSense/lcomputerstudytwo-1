package com.lcomputerstudy.example.domain;

import java.util.List;

public class ResAnswer {
	private int qIdx;
	private List<ResItem> resItems;
	private int sIdx;
	
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public List<ResItem> getResItems() {
		return resItems;
	}
	public void setResItems(List<ResItem> resItems) {
		this.resItems = resItems;
	}
	@Override
	public String toString() {
		return "ResAnswer [qIdx=" + qIdx + ", resItems=" + resItems + ", sIdx=" + sIdx + "]";
	}
	
	
	
}
