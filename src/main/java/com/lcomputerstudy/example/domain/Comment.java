package com.lcomputerstudy.example.domain;

public class Comment {
	private String cContent;
	private String cId;
	private String cDateTime;
	private String cName;
	private int cIdx;
	private int cBidx;
	private int cOrder;
	private int cDepth;
	private int cGroup;
	private User user;
	
	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcDateTime() {
		return cDateTime;
	}
	public void setcDateTime(String cDateTime) {
		this.cDateTime = cDateTime;
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public int getcBidx() {
		return cBidx;
	}
	public void setcBidx(int cBidx) {
		this.cBidx = cBidx;
	}
	public int getcOrder() {
		return cOrder;
	}
	public void setcOrder(int cOrder) {
		this.cOrder = cOrder;
	}
	public int getcDepth() {
		return cDepth;
	}
	public void setcDepth(int cDepth) {
		this.cDepth = cDepth;
	}
	public int getcGroup() {
		return cGroup;
	}
	public void setcGroup(int cGroup) {
		this.cGroup = cGroup;
	}
	@Override
	public String toString() {
		return "Comment [cContent=" + cContent + ", cId=" + cId + ", cDateTime=" + cDateTime + ", cIdx=" + cIdx
				+ ", cBidx=" + cBidx + ", cOrder=" + cOrder + ", cDepth=" + cDepth + ", cGroup=" + cGroup + "]";
	}
		
}
