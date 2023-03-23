package com.lcomputerstudy.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.service.CommentService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@RequestMapping("comment")
	public String tmp() {
		return "";
	}
	
}
