package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Bookmark;

@Repository
public class BookmarksDAOImpl implements BookmarksDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Bookmark> mybookmarkListForCliming(int memberNo) {
		return session.selectList("bookmarks.mybookmarkListForCliming", memberNo);
	}
	
	@Override
	public int addMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return session.insert("bookmarks.addMovie", bookmark);
	}

	@Override
	public int deleteMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return session.delete("bookmarks.deleteMovie", bookmark);
	}

	@Override
	public int bookmarkCheck(Bookmark bookmark) {
		// TODO Auto-generated method stub
		int result = session.selectOne("bookmarks.bookmarkCheck", bookmark);
		
		return result;
	}
}
