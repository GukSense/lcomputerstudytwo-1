package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;

public interface BoardService /*extends UserDetailsService*/{
	public List<Board> selectBoardList(Pagination pagination);	// 게시글리스트불러오기
	
	public void insertBoard(Board board);	// 글등록
	
	public void replyBoard(Board board);	// 답글
	
	public Board viewBoard(Board board);	// 보기
	
	public void deleteBoard(Board board);	// 삭제
	
	public void editBoard(Board board);		// 수정
	
	public int countBoard();				// 카운트
}

	

