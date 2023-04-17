package com.lcomputerstudy.example.domain;

public class item {
	private String content;
	private Question question;
	
	
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
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
