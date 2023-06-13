package com.lcomputerstudy.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.Search;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.CommentService;
import com.lcomputerstudy.example.service.UserService;


@org.springframework.stereotype.Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	@Autowired UserService userService;
	@Autowired CommentService commentService;
	
	@RequestMapping("/board/boardList")
	public String boardList(Model model, Pagination pagination, Search search) {
		
		System.out.println(search);
		int boardCount = boardService.countBoard();
		System.out.println("보드카운트: "+boardCount);
		
		Pagination pagi = new Pagination();
		pagi.setSearch(search);
		System.out.println("카테고리: " + pagi.getSearch().getCategory());
		System.out.println("타겟: " + pagi.getSearch().getTarget() + " 키워드: " + pagi.getSearch().getKeyword() );
		pagi.setCount(boardCount);
		pagi.setPage(pagination.getPage());
		pagi.init();
		//pagi.setSearch(search);
		List<Board> list = boardService.selectBoardList(pagi);
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagi);
		return "/board/boardList";
	}
	@RequestMapping("/board/beforeWriteBoard")
	public String beforeWriteBoard() {
		return "/board/writeBoard";
	}
	
	
	@RequestMapping("/board/writeBoard")
	public String insertBoard(Board board, MultipartFile file, Model model) throws Exception {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setUser(user);
		boardService.insertBoard(board, file);
		
		model.addAttribute("board", board);
		return "redirect:/board/boardList";
	}
	@GetMapping("/board/viewBoard/{bIdx}")
	public String viewBoard(Model model, Board board, Comment comment) {
		board = boardService.viewBoard(board);
		
		//코멘트
		System.out.println("댓글 목록 컨트롤러 동작");
		List<Comment> list = commentService.getCommentList(board.getbIdx());
		int total = commentService.getCount(board.getbIdx());
		System.out.println(board.getbIdx());		
		System.out.println(total);
		
		model.addAttribute("list", list);		
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		
		return "/board/viewBoard";
	}
	@RequestMapping("/board/beforeReplyBoard/{bOrder}&{bGroup}&{bDepth}")
	public String beforeReplyBoard(Model model, Board board) {
		
		model.addAttribute("board", board);
		
		return "/board/replyBoard";
	} 
	@PostMapping("/board/replyBoard")
	public String replyBoard(Board board, MultipartFile file) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setUser(user);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		board.setbOrder(board.getbOrder() + 1);
		boardService.replyBoard(board, file); 
		
		return "redirect:/board/boardList";
	}
	@RequestMapping("/board/beforeEditBoard/{bIdx}")
	public String beforeEditBoard(Model model, Board board) {
		System.out.println(board.getbIdx());
		model.addAttribute("board", board);
		return "/board/editBoard";
	}
	@RequestMapping("/board/editBoard")
	public String editBoard(Board board, MultipartFile file) {
		boardService.editBoard(board, file);
		return "/board/editResult";
	}
	@RequestMapping("/board/deleteBoard/{bIdx}")
	public String deleteBoard(Board board) {
		boardService.deleteBoard(board);
		return "redirect:/board/boardList";
	}
}
