package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;


@org.springframework.stereotype.Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	@Autowired UserService userService;
	
	@RequestMapping("/board/boardList")
	public String boardList(Model model) {
		List<Board> list = boardService.selectBoardList();
		model.addAttribute("list", list);
		
		return "/board/boardList";
	}
	@RequestMapping("/board/beforeWriteBoard")
	public String beforeWriteBoard() {
		return "/board/writeBoard";
	}
	
	
	@RequestMapping("/board/writeBoard")
	public String insertBoard(Board board) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setUser(user);
		boardService.insertBoard(board);
		return "/board/boardList";
	}
	@GetMapping("/board/viewBoard/{bIdx}")
	public String viewBoard(Model model, Board board) {
		board = boardService.viewBoard(board);
		model.addAttribute("board", board);
		return "/board/viewBoard";
	}
	@RequestMapping("/board/beforeReplyBoard/{bOrder}&{bGroup}&{bDepth}")
	public String beforeReplyBoard(Model model, Board board) {
		
		model.addAttribute("board", board);
		
		return "/board/replyBoard";
	} 
	@PostMapping("/board/replyBoard")
	public String replyBoard(Board board) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setUser(user);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		board.setbOrder(board.getbOrder() + 1);
		boardService.replyBoard(board); 
		return "/board/boardList";
	}
	
}
