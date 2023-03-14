package com.lcomputerstudy.example.controller;

<<<<<<< Updated upstream
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
>>>>>>> Stashed changes
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.service.BoardService;
<<<<<<< Updated upstream
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
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		UserDetails userDetails = (UserDetails)principal; 
//		String username = ((UserDetails) principal).getUsername();  
		board.setbWriter("username");
		boardService.insertBoard(board);
		return "/board/boardList";
	}
	@RequestMapping("/board/viewBoard")
	public String viewBoard() {
		
		return "/board/viewBoard";
	}
=======

@Controller
public class BoardController {
	@Autowired BoardService boardservice;
	
	@RequestMapping("/Board/beforeInsertBoard")
	public String beforeInsertBoard() {
		return "/Board/insertBoard";
	}
	
	@RequestMapping("/Board/boardIndex")
	public String boardIndex(Board board) {
		boardservice.insertBoard(board);
		return "/Board/boardIndex";
	}
	
	@RequestMapping("/Board/Home")
	public String boardHome() {
		
		
		
		
		return "/Board/boardIndex";
	}
	
>>>>>>> Stashed changes
}
