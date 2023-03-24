package com.lcomputerstudy.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.service.CommentService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@RequestMapping("/comment/writeComment")
	public @ResponseBody String writeComment(@RequestBody  @ModelAttribute Comment comment) {
		
		commentService.writeComment(comment);
		
		return "/board/viewBoard";
	}
	
	@RequestMapping("")
	public String getCommnetList() {
		return "";
	}
}
