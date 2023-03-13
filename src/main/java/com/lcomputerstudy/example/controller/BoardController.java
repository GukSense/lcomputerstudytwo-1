package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.service.BoardService;


@org.springframework.stereotype.Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	
	@RequestMapping("/board/boardList")
	public String boardList(Model model) {
		List<Board> list = boardService.selectBoardList();
		model.addAttribute("list", list);
		
		return "/board/boardList";
	}
	
	@RequestMapping("/board/writeBoard")
	public String insertBoard(Board board) {
		
		boardService.insertBoard(board);
		return "/board/boardList";
	}
	@RequestMapping("/board/viewBoard")
	public String viewBoard() {
		
		return "/board/viewBoard";
	}
}
