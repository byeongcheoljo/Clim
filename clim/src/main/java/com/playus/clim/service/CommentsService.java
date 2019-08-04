package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.Comment;

public interface CommentsService {
	
	public Map<String, Object> getMyComments(int memberNo, int page);

	public int insertComment(Comment comment);
}
