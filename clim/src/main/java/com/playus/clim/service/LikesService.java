package com.playus.clim.service;

import java.util.Map;

public interface LikesService {

	public Map<String, Object> boardLike(int memberNo, int boardNo);
	
	public Map<String, Object> boardCommentLike(int memberNo, int postNo);
	
}
