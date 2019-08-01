package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.PageVO;

public interface ReviewsService {
	
	public Map<String, Object> getMyReviews(int memberNo, int page); 

}
