package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.vo.Bookmark;

@Service
public class BookmarksServiceImpl implements BookmarksService{
	@Autowired
	private BookmarksDAO bookmarksDAO;
	
	@Override
	public void addClimingList(int roomNo, int movieNo) {
		// TODO Auto-generated method stub
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(movieNo);
		bookmark.setMemberNo(roomNo);
		bookmarksDAO.insertClimingList(bookmark);
		
	}

}
