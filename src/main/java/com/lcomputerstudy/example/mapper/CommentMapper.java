package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Comment;

@Mapper
public interface CommentMapper {
	//코멘트인설트
	public void writeComment(Comment comment);
	//코멘트 리스트
	public List<Comment> getCommentList(int comment_bIdx);
	//코멘트 카운트
	public int getCount(int comment_bIdx);
	
	
	
	
	
	
}
