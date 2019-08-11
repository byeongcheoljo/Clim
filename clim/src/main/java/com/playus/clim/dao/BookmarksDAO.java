package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;

public interface BookmarksDAO {
	
	public List<Bookmark> mybookmarkListForCliming(int memberNo);

	public int addMovie(Bookmark bookmark);

	public int deleteMovie(Bookmark bookmark);

	public int bookmarkCheck(Bookmark bookmark);

}
