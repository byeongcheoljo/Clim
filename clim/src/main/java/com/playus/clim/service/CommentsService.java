package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.Comment;

public interface CommentsService {
	/* 0802 홍성표 */
	public Map<String, Object> getMyComments(int memberNo, int page);

	public int insertComment(Comment comment);
}
