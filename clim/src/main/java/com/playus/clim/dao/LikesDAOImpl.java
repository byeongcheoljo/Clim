package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Like;

@Repository
public class LikesDAOImpl implements LikesDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int boardLikeUp(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.boardLikeUp", like);
	}

	@Override
	public int boardLikeDown(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.boardLikeDown", like);
	}
	
	@Override
	public int boardLikeCheck(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.boardLikeCheck", like);
	}
	
	@Override
	public int boardLikeTotal(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.boardLikeTotal", boardNo);
	}
	
	@Override
	public int boardCommentLikeUp(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.boardCommentLikeUp", like);
	}
	
	@Override
	public int boardCommentLikeDown(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.boardCommentLikeDown", like);
	}
	
	@Override
	public int boardCommentLikeCheck(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.boardCommentLikeCheck",like);
	}
	
	@Override
	public int boardCommentLikeTotal(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.boardCommentLikeTotal",postNo);
	}
	
}
