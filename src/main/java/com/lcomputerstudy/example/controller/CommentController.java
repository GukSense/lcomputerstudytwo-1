package com.lcomputerstudy.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.service.CommentService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@RequestMapping("/comment/writeComment")
	public String writeComment(@RequestBody  @ModelAttribute Comment comment, Model model) {
		
		commentService.writeComment(comment);
		System.out.println("댓글 목록 컨트롤러 동작");
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		System.out.println("보드넘버: " + comment.getcBidx());
		
		System.out.println("댓글 카운트: "+ total);
		
		model.addAttribute("list", list);
		return "redirect:/test";
	}
	
	@RequestMapping("/test")
	public String commentList(HttpServletRequest request, Model model) {
		System.out.println("리다이렉트 동작");
		String list = request.getParameter("list");
		model.addAttribute("list", list);
		return "/board/viewBoard";
	}
	
	@RequestMapping("/delete-comment")
	public @ResponseBody String deleteComment(@RequestBody  @ModelAttribute Comment comment) {
		System.out.println("댓글 삭제 컨트롤러 동작");
	
		commentService.deleteComment(comment);
		return "/board/viewBoard";
	}
	@RequestMapping("/edit-comment")
	public @ResponseBody String editComment(@RequestBody @ModelAttribute Comment comment) {
		System.out.println(comment);
		commentService.editComment(comment);
		return "/board/viewBoard";
	}
}
