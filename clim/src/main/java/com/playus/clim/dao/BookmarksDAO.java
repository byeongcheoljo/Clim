package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Movie;

public interface BookmarksDAO {

	public List<Bookmark> mybookmarkListForCliming(int memberNo);


	public int bookmarkInsertForCliming(Bookmark bookmark);

	public int bookmarkDeleteForCliming(int no);

	public Bookmark checkBookmarkOneForCliming(Bookmark bookmark);

	public void insertClimingList(Bookmark bookmark);


	public List<Bookmark> mybookmarkListForMovies(int no);

	public int deletMybookmarkMovie(int no);

	public void deleteClimingList(Bookmark bookmark);

	public Bookmark checkClimingList(Bookmark bookmark);

	public int bookmarkCheck(Bookmark bookmark);
	
	public int bookmarkChecWithType(Bookmark bookmark);
	
	public int boomarkForMovieInsert(Bookmark bookmark);

	public int boomarkForMovieDelete(Bookmark bookmark);

	public int addMovie(Bookmark bookmark);

	public int deleteMovie(Bookmark bookmark);



}
