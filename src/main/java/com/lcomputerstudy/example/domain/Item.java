package com.lcomputerstudy.example.domain;

public class Item {
	private int idx;
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "item [content=" + content + "]";
	}

	
	
}
