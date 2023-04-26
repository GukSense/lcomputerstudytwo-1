package com.lcomputerstudy.example.domain;

public class ResItem {
	private String content;
	private int sIdx;
	private int qIdx;
	
	
	
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ResItem [content=" + content + ", sIdx=" + sIdx + ", qIdx=" + qIdx + "]";
	}

	
	
	
	
}
