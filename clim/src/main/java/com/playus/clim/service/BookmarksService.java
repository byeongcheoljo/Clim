package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.Bookmark;

public interface BookmarksService {

	//wogus
	public Map<String, Object> addMovie(Bookmark bookmark);
	public int deleteMovie(Bookmark bookmark);
	

}
