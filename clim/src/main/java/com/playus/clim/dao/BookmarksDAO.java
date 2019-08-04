package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Movie;

public interface BookmarksDAO {
	
	public List<Bookmark> mybookmarkListForCliming(int memberNo);

	public void insertClimingList(Bookmark bookmark);

	public void deleteClimingList(Bookmark bookmark);

	public Bookmark checkClimingList(Bookmark bookmark);

}
