package com.lcomputerstudy.example.domain;

public class Board {
	private int bIdx;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bDateTime;
	private String bCategory;
	private User user;
	
	
	
<<<<<<< Updated upstream
	
	public User getUser() {
		return user;
=======
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}
	public int getbId() {
		return bId;
>>>>>>> Stashed changes
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbDateTime() {
		return bDateTime;
	}
	public void setbDateTime(String bDateTime) {
		this.bDateTime = bDateTime;
	}
	
	
}
