package com.lcomputerstudy.example.domain;

import java.util.List;

public class Question {
	private String type;
	private String value;
	private List<item> items;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public List<item> getItems() {
		return items;
	}
	public void setItems(List<item> items) {
		this.items = items;
	}
	
	
}
