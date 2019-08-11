package com.playus.clim.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.vo.Bookmark;

import com.playus.clim.vo.Member;

@Service
public class BookmarksServiceImpl implements BookmarksService {
	/* 0802 홍성표 */
	@Autowired
	private BookmarksDAO bookmarksDAO;

	@Override
	public List<Bookmark> getmyBookmarkListForCliming(HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");

		int memberNo = 1;

		return bookmarksDAO.mybookmarkListForCliming(memberNo);
	}
	
	@Override
	public int deleteMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarksDAO.deleteMovie(bookmark);

	}
	
	@Override
	public Map<String, Object> addMovie(Bookmark bookmark) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("bookmark", bookmarksDAO.addMovie(bookmark));
		
		return map;
	}
	

	@Override
	public int addBookmarkOfCliming(Bookmark bookmark) {

		if (bookmarksDAO.checkBookmarkOneForCliming(bookmark) == null) {
			return bookmarksDAO.bookmarkInsertForCliming(bookmark);
		} else {
			return 0;
		}

	}

	@Override
	public int removeBookmarkOfCliming(int no) {
		return bookmarksDAO.bookmarkDeleteForCliming(no);
	}
	

	@Override
	public String addClimingList(int roomNo, int movieNo) {
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(movieNo);
		bookmark.setMemberNo(roomNo);

		if(bookmarksDAO.checkClimingList(bookmark) != null) {

			return "{\"result\":" + false + "}";
		}
		else {
			bookmarksDAO.insertClimingList(bookmark);
			return "{\"result\":" + true + "}";
		}

	}

	@Override
	public List<Bookmark> getMyMovieList(int no) {
		return bookmarksDAO.mybookmarkListForMovies(no);
	}

	@Override
	public int deletMybookmarkMovie(int no) {
		return bookmarksDAO.deletMybookmarkMovie(no);
	}
	
	@Override
	public void deleteClimingList(int roomNo, int movieNo) {
		// TODO Auto-generated method stub
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(movieNo);
		bookmark.setMemberNo(roomNo);
		bookmarksDAO.deleteClimingList(bookmark);
	}
	
	@Override
	public int bookmarkForMovie(int movieNo, int memberNo) {
		
		Bookmark bookmark = new Bookmark();
		bookmark.setMemberNo(memberNo);
		bookmark.setMovieNo(movieNo);
		
		int count = bookmarksDAO.bookmarkCheck(bookmark);
		
		if(count ==1) {
			int result = bookmarksDAO.boomarkForMovieDelete(bookmark);
			System.out.println("delete:"+result);
		}else {
			int result = bookmarksDAO.boomarkForMovieInsert(bookmark);
			System.out.println("insert:"+result);
		}
		
		return count;

	}
	
	
	
}
