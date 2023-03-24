package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {
	@Autowired CommentMapper commentmapper;
	
	@Override
	public void writeComment(Comment comment) {
		commentmapper.writeComment(comment);
	}
	@Override
	public List<Comment> getCommentList(int comment_bIdx) {
		return commentmapper.getCommentList(comment_bIdx);
	}	
	
	@Override
	public int getCount(int comment_bIdx) {
		return commentmapper.getCount(comment_bIdx);
	}	
}
