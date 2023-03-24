package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Comment;

public interface CommentService {
	//코멘트인설트
	public void writeComment(Comment comment);
	//코멘트 리스트
	public int getCount(int comment_bIdx);
	//코멘트 카운트
	public List<Comment> getCommentList(int comment_bIdx);
}
