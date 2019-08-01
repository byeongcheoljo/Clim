package com.playus.clim.service;

import java.util.Map;

public interface CommentsService {
	
	public Map<String, Object> getMyComments(int memberNo, int page);

}
