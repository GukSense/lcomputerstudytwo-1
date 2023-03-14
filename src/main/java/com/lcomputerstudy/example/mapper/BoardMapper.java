package com.lcomputerstudy.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Board;

@Mapper
public interface BoardMapper {
	//게시판보기
	public List<Board> selectBoardList();
<<<<<<< Updated upstream
	
=======

	//게시판글쓰기
>>>>>>> Stashed changes
	public void insertBoard(Board board);
}

