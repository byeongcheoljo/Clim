package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;

public interface BookmarksDAO {
	
	public List<Bookmark> mybookmarkListForCliming(int memberNo);
	public int bookmarkInsertForCliming(Bookmark bookmark);
	public int bookmarkDeleteForCliming(int no);
	public Bookmark checkBookmarkOneForCliming(Bookmark bookmark);

	public void insertClimingList(Bookmark bookmark);

	public List<Bookmark> mybookmarkListForMovies(int no);
	
	public int deletMybookmarkMovie(int no);
	
}
