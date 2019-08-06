package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import com.playus.clim.vo.Bookmark;

public interface BoardsService {
	
	/* 0802 홍성표 */
	public Map<String, Object> getMyBoards(int memberNo, int page);

	public List<Bookmark> getMyMovieList(int no);
	
}
