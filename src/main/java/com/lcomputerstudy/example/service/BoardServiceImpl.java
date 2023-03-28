package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired  BoardMapper  boardmapper;
	
	@Override
	public List<Board> selectBoardList(Pagination pagination){
		System.out.println("----- at Service -----");
		System.out.println("카테고리: " + pagination.getSearch().getCategory());
		System.out.println("타겟: " + pagination.getSearch().getTarget());
		System.out.println("키워드: " + pagination.getSearch().getKeyword());
		return boardmapper.selectBoardList(pagination);
	}
	@Override
	public void insertBoard(Board board) {
		boardmapper.insertBoard(board);
		System.out.println(board.getbIdx());	//bIDx check
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
	@Override
	public int countBoard() {
		return boardmapper.countBoard();
	}
}
