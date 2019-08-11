package com.playus.clim.service;


import java.util.List;
import javax.servlet.http.HttpSession;

import java.util.Map;


import com.playus.clim.vo.Bookmark;

public interface BookmarksService {


	//void addClimingList(int roomNo, int movieNo);

	public List<Bookmark> getMyMovieList(int no);

	public int deletMybookmarkMovie(int no);

	/* 0802 홍성표 */
	public List<Bookmark> getmyBookmarkListForCliming(HttpSession session);

	public int addBookmarkOfCliming(Bookmark bookmark);

	public int removeBookmarkOfCliming(int no);

	public String addClimingList(int roomNo, int movieNo);

	public void deleteClimingList(int roomNo, int movieNo);

	//wogus
	public Map<String, Object> addMovie(Bookmark bookmark);
	public int deleteMovie(Bookmark bookmark);

	
	public int bookmarkForMovie(int movieNo, int memberNo);

}
