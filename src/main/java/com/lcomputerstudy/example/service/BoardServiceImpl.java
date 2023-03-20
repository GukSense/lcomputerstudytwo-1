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
		boardmapper.replyInsertBoard(board);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		boardmapper.depthGroupUpdate(board);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		boardmapper.orderUpdate(board);
		
	}
	@Override
	public Board viewBoard(Board board) {
		System.out.println(board.getbIdx());	// bIdx check
		boardmapper.hitsBoard(board);
		return boardmapper.viewBoard(board);
	} 
	@Override
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
	}
	@Override
	public void editBoard(Board board) {
		boardmapper.editBoard(board);
	}
}
