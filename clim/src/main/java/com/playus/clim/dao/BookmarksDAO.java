package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;

public interface BookmarksDAO {
	
	public List<Bookmark> mybookmarkListForCliming(int memberNo);

}
