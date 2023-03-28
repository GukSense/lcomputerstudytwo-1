package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Comment;

@Mapper
public interface CommentMapper {
	//코멘트인설트
	public void writeComment(Comment comment);
	//코멘트 그룹 업데이트
	public void updateComment(Comment comment);
	//코멘트 리스트
	public List<Comment> getCommentList(int comment_bIdx);
	//코멘트 카운트
	public int getCount(int comment_bIdx);
	//코멘트 삭제
	public void deleteComment(Comment comment);
	//코멘트 수정
	public void editComment(Comment comment);
	//코멘트 답글
	public void replyComment(Comment comment); 
	public void depthGroupUpdate(Comment comment);
	public void orderUpdate(Comment comment); 
	
	
}
