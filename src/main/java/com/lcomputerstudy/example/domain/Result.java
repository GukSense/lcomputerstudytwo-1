package com.lcomputerstudy.example.domain;

public class Result {
	private int sIdx;
	private int qIdx;
	private String content;
	private int count;
	private String qTitle;
	
	
	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	@Override
	public String toString() {
		return "Result [sIdx=" + sIdx + ", qIdx=" + qIdx  + ", qTitle=" + qTitle  + ", content=" + content + ", count=" + count + "]";
	}
	
	
	
}
