package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.CommentService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class CommentController {
	@Autowired CommentService commentService;
	@Autowired BoardService boardService;
	@Autowired UserService userService;
	
	@RequestMapping("/comment/writeComment")
	public String writeComment(@ModelAttribute Comment comment, Model model) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		comment.setUser(user);
		commentService.writeComment(comment);		
		System.out.println("댓글 목록 컨트롤러 동작");
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
	public String deleteComment(@ModelAttribute Comment comment, Model model) {
		System.out.println("댓글 삭제 컨트롤러 동작");
		commentService.deleteComment(comment);
		
		System.out.println("댓글 목록 컨트롤러 동작");
		Board board = new Board();
		board.setbIdx(comment.getcBidx());
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		
		System.out.println("보드넘버: " + total);		
				
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		
		return "/board/commentList";
		
	}
	@RequestMapping("/edit-comment")
	public String editComment(@ModelAttribute Comment comment, Model model) {
		System.out.println("댓글 수정 기능 동작");
		commentService.editComment(comment);
		
		System.out.println("댓글 목록 컨트롤러 동작");
		Board board = new Board();
		board.setbIdx(comment.getcBidx());
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		
		System.out.println("보드넘버: " + total);		
				
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		
		return "/board/commentList";
	}
	@RequestMapping("/reply-comment")
	public String replyComment(@ModelAttribute Comment comment, Model model) {
		System.out.println("댓글 답글 기능 동작");
		comment.setcOrder(comment.getcOrder()+1);
		commentService.replyComment(comment);
		
		System.out.println("댓글 목록 컨트롤러 동작");
		Board board = new Board();
		board.setbIdx(comment.getcBidx());
		List<Comment> list = commentService.getCommentList(comment.getcBidx());
		int total = commentService.getCount(comment.getcBidx());
		
		System.out.println("보드넘버: " + total);		
				
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		return "/board/commentList";
	}
	
}
