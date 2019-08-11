package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.PageVO;

public interface ReviewsService {
	/* 0802 홍성표 */
	public Map<String, Object> getMyReviews(int memberNo, int page); 

}
