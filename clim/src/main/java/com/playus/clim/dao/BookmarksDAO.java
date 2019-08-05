package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;

public interface BookmarksDAO {
	
	public List<Bookmark> mybookmarkListForCliming(int memberNo);

	public void insertClimingList(Bookmark bookmark);

	public List<Bookmark> mybookmarkListForMovies(int no);
	
	public int deletMybookmarkMovie(int no);
	
}
