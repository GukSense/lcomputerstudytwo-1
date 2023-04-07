package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;

public interface BoardService /*extends UserDetailsService*/{
	public List<Board> selectBoardList(Pagination pagination);	// 게시글리스트불러오기
	
	public void insertBoard(Board board, MultipartFile file) throws Exception;	// 글등록
	
	public void replyBoard(Board board, MultipartFile file);	// 답글
	
	public Board viewBoard(Board board);	// 보기
	
	public void deleteBoard(Board board);	// 삭제
	
	public void editBoard(Board board, MultipartFile file);		// 수정
	
	public int countBoard();				// 카운트
}

	

