package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Bookmark;

public interface BookmarksService {

	void addClimingList(int roomNo, int movieNo);

	public List<Bookmark> getMyMovieList(int memberNo);
	
	public int deletMybookmarkMovie(int no);

}
