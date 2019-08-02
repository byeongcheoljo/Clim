package com.playus.clim.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.playus.clim.vo.Bookmark;

public interface BookmarksService {
	
	public List<Bookmark> getmyBookmarkListForCliming(HttpSession session);
	public int addBookmarkOfCliming(Bookmark bookmark);
	public int removeBookmarkOfCliming(int no);

}
