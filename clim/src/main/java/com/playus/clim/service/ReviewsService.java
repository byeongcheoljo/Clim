package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.Like;
import com.playus.clim.vo.Report;
import com.playus.clim.vo.Review;

public interface ReviewsService {

	/* 0802 홍성표 */
	public Map<String, Object> getMyReviews(int memberNo, int page); 

	//재현
	public Map<String, Object> getReviewList(int movieNo, int page, Report report, Like like);

	public Map<String, Object> registerReview(Review review);

	public int deleteMyReview(int no);


}
