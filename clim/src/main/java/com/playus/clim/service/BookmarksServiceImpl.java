package com.playus.clim.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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

		// int memberNo = member.getNo();

		int memberNo = 1;

		return bookmarksDAO.mybookmarkListForCliming(memberNo);
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
	public void addClimingList(int roomNo, int movieNo) {
		// TODO Auto-generated method stub
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(movieNo);
		bookmark.setMemberNo(roomNo);
		bookmarksDAO.insertClimingList(bookmark);

	}

	@Override
	public List<Bookmark> getMyMovieList(int no) {
		// TODO Auto-generated method stub

		return bookmarksDAO.mybookmarkListForMovies(no);
	}

	@Override
	public int deletMybookmarkMovie(int no) {
		// TODO Auto-generated method stub
		return bookmarksDAO.deletMybookmarkMovie(no);
	}

}
