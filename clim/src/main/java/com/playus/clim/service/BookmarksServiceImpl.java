package com.playus.clim.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.vo.Bookmark;

@Service
public class BookmarksServiceImpl implements BookmarksService{
	
	@Autowired
	private BookmarksDAO bookmarksDAO;
	
	@Override
	public Map<String, Object> addMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("bookmark", bookmarksDAO.addMovie(bookmark));
		
		return map;
	}
	@Override
	public int deleteMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarksDAO.deleteMovie(bookmark);
	}

}
