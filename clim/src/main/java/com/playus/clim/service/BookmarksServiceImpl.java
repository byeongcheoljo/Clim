package com.playus.clim.service;

<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpSession;

=======
>>>>>>> master
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.vo.Bookmark;
<<<<<<< HEAD
import com.playus.clim.vo.Member;
=======
>>>>>>> master

@Service
public class BookmarksServiceImpl implements BookmarksService{
	@Autowired
	private BookmarksDAO bookmarksDAO;
	
<<<<<<< HEAD
	/* 0802 홍성표 */
	@Autowired
	private BookmarksDAO bookmarksDAO;

	@Override
	public List<Bookmark> getmyBookmarkListForCliming(HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		
		// int memberNo = member.getNo();
		
		int memberNo = 1;
		
		return bookmarksDAO.mybookmarkListForCliming(memberNo);
	}
	
	@Override
	public int addBookmarkOfCliming(Bookmark bookmark) {
		
		if(bookmarksDAO.checkBookmarkOneForCliming(bookmark)==null) {
			return bookmarksDAO.bookmarkInsertForCliming(bookmark);
		}else {
			return 0;
		}
		
	}
	
	@Override
	public int removeBookmarkOfCliming(int no) {
		return bookmarksDAO.bookmarkDeleteForCliming(no);
	}
	
	
=======
	@Override
	public void addClimingList(int roomNo, int movieNo) {
		// TODO Auto-generated method stub
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(movieNo);
		bookmark.setMemberNo(roomNo);
		bookmarksDAO.insertClimingList(bookmark);
		
	}
>>>>>>> master

}
