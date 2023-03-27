package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.CommentService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	@Autowired BoardService boardService;
	@Autowired UserService userService;
	
	@RequestMapping("/comment/writeComment")
	public String writeComment(@ModelAttribute Comment comment, Model model, RedirectAttributes redirect) {
		
		commentService.writeComment(comment);
		/*
		System.out.println("댓글 목록 컨트롤러 동작");
		Board board = new Board();
		board.setbIdx(comment.getcBidx());
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		
		System.out.println("보드넘버: " + total);		
				
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		*/
		redirect.addFlashAttribute("comment", comment);
		return "redirect:/comment/commentList";
	}
	
	@RequestMapping("/comment/commentList")
	public String commentList(@ModelAttribute Comment comment, Model model) {
		System.out.println("댓글 목록 컨트롤러 동작");
		System.out.println(comment);
		Board board = new Board();
		board.setbIdx(comment.getcBidx());
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		
		System.out.println("보드넘버: " + total);		
				
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		return "/board/commentList";
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
