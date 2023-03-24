package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.service.CommentService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@RequestMapping("/comment/writeComment")
	public @ResponseBody String writeComment(@RequestBody  @ModelAttribute Comment comment, Model model) {
		
		commentService.writeComment(comment);
		System.out.println("댓글 목록 컨트롤러 동작");
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		System.out.println(comment.getcBidx());
		
		System.out.println(total);
		
		model.addAttribute("list", list);
		return "/board/viewBoard";
	}
	
	@RequestMapping("/delete-comment")
	public @ResponseBody String deleteComment(@RequestBody  @ModelAttribute Comment comment) {
		System.out.println("댓글 삭제 컨트롤러 동작");
		
		commentService.deleteComment(comment.getcBidx(), comment.getcIdx());
		return "/board/viewBoard";
	}
}
