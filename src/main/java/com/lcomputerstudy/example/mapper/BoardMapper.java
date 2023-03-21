package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;

@Mapper
public interface BoardMapper {
	//게시판보기
	public List<Board> selectBoardList(Pagination pagination);
	//게시판 글쓰기
	public void insertBoard(Board board);
	//그룹업데이트
	public void updateBoard(Board board);
	//답글기능
	public void replyInsertBoard(Board board);	public void depthGroupUpdate(Board board);	public void orderUpdate(Board board);
	//보기
	public Board viewBoard(Board board);	public void hitsBoard(Board board);
	//삭제
	public void deleteBoard(Board board);
	//수정
	public void editBoard(Board board);
	//게시판 카운트
	public int countBoard();
}

