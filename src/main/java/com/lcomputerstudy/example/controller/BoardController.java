package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
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
	@RequestMapping("/board/viewBoard")
	public String viewBoard(Board board) {
		
		
		return "/board/viewBoard";
	}
	
	
}
