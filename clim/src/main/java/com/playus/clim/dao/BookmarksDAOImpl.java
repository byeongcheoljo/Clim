package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Movie;

@Repository
public class BookmarksDAOImpl implements BookmarksDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Bookmark> mybookmarkListForCliming(int memberNo) {
		return session.selectList("bookmarks.mybookmarkListForCliming", memberNo);
	}
	@Override
	public void insertClimingList(Bookmark bookmark) {
		// TODO Auto-generated method stub
		session.insert("bookmarks.insertClimingList", bookmark);
	}
	@Override
	public void deleteClimingList(Bookmark bookmark) {
		// TODO Auto-generated method stub
		session.delete("bookmarks.deleteClimingList",bookmark);
	}
	@Override
	public Bookmark checkClimingList(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return session.selectOne("bookmarks.checkClimingList",bookmark);
	}

}
