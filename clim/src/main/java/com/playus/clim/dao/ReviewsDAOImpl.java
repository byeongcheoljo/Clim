package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Review> myWriteReviewsList(PageVO pageVO) {
		return session.selectList("reviews.myWriteReviewsList", pageVO);
	}
	
	@Override
	public int myWriteReviewsTotal(int memberNo) {
		return session.selectOne("reviews.myWriteReviewsTotal", memberNo);
	}

}
