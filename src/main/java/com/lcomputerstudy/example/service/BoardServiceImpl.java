package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired  BoardMapper  boardmapper;
	
	@Override
	public List<Board> selectBoardList(){
		return boardmapper.selectBoardList();
	}
	@Override
	public void insertBoard(Board board) {
		boardmapper.insertBoard(board);
		System.out.println(board.getbIdx());
		boardmapper.updateBoard(board);
		
	}
	@Override
	public void replyBoard(Board board) {
		boardmapper.replyBoard(board);		
	}
	@Override
	public Board viewBoard(Board board) {
		System.out.println(board.getbIdx());	// bIdx check
		return boardmapper.viewBoard(board);
	} 
	
	
}
