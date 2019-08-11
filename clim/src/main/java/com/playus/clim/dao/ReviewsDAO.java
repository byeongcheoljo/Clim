package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Review;

public interface ReviewsDAO {
	/* 0803 홍성표 */
	public List<Review> myWriteReviewsList(PageVO pageVO);
	public int myWriteReviewsTotal(int memberNo);
	
	//재현
	public List<Review> getReviewList(PageVO pageVO);
	public int getReviewTotalList(int movieNo);
	public int registerReview(Review review);
	public int deleteMyReview(int no);
	public int selectMovieDetailScore(int movieNo);
	
}



