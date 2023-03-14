package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Board;

@Mapper
public interface BoardMapper {
	//게시판보기
	public List<Board> selectBoardList();
	//게시판 글쓰기
	public void insertBoard(Board board);
	//그룹업데이트
	public void updateBoard(Board board);
}

