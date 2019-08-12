package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO{
	/* 0803 홍성표 */
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
	
	@Override
	public List<Review> getReviewList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.reviewSelectList", pageVO);
	}
	
	@Override
	public int getReviewTotalList(int movieNo) {
		// TODO Auto-generated method stub
		System.out.println("ReviewsDAOImpl movieNo:"+movieNo);
		return session.selectOne("reviews.reviewSelectTotalList", movieNo);
	}
	@Override
	public int registerReview(Review review) {
		// TODO Auto-generated method stub
		return session.insert("reviews.registerReview", review);
	}
	@Override
	public int deleteMyReview(int no) {
		// TODO Auto-generated method stub
		return session.delete("reviews.deleteMyReview", no);
	}

	@Override
	public int selectMovieDetailScore(int movieNo) {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.selectMovieDetailScore", movieNo);
	}

}
