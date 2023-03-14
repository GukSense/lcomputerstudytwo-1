package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.lcomputerstudy.example.domain.Board;

public interface BoardService /*extends UserDetailsService*/{
	public List<Board> selectBoardList();
	
<<<<<<< Updated upstream
=======
	
>>>>>>> Stashed changes
	public void insertBoard(Board board);
}

	

