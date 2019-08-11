package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.playus.clim.vo.Like;

@Repository
public class LikesDAOImpl implements LikesDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int checkLike(Like like) {
		// TODO Auto-generated method stub
		int result = session.selectOne("likes.checkLike", like);
		return result;
	}

	@Override
	@Transactional
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		session.delete("likes.deleteLike", like);
		int result = session.insert("likes.insertLike", like);
		return result;
	}
	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		System.out.println(like.getPostNo());
		System.out.println(like.getMemberNo());
		System.out.println(like.getType());
		
		int result = session.delete("likes.deleteLike", like);
		return result;
	}
	
	@Override
	public int countLike(Like like) {
		// TODO Auto-generated method stub
		int result = session.selectOne("likes.countLike", like);
		return result;
	}
	@Override
	public int countDisLike(Like like) {
		// TODO Auto-generated method stub
		int result = session.selectOne("likes.countLike", like);
		if (result >= 20) {
			session.delete("reviews.deleteMyReview", like.getPostNo());
		}
		return result;
	}
	
}
