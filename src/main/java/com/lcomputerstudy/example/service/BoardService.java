package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Board;

public interface BoardService /*extends UserDetailsService*/{
	public List<Board> selectBoardList();
	
	public void insertBoard(Board board);
	

}

	

