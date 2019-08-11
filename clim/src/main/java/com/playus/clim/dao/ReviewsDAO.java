package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Review;

public interface ReviewsDAO {
	/* 0803 홍성표 */
	public List<Review> myWriteReviewsList(PageVO pageVO);
	public int myWriteReviewsTotal(int memberNo);

}
