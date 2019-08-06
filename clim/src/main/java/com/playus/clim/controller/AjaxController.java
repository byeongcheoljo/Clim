package com.playus.clim.controller;

import java.util.List; 
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.playus.clim.service.BoardsService;
import com.playus.clim.service.BookmarksService;
import com.playus.clim.service.ClimingMovieListsService;
import com.playus.clim.service.CommentsService;
<<<<<<< HEAD
import com.playus.clim.service.ContinueMoviesService;
=======
import com.playus.clim.service.MembersService;
>>>>>>> master
import com.playus.clim.service.EventsService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.ReportsService;
import com.playus.clim.service.ReviewsService;
<<<<<<< HEAD
import com.playus.clim.vo.ContinueMovie;
=======
import com.playus.clim.vo.Bookmark;
>>>>>>> master
import com.playus.clim.vo.Event;
import com.playus.clim.vo.Movie;

@RestController
@RequestMapping(value = "/ajax")
public class AjaxController {
	/* 0803 홍성표 */
	@Autowired
	private BoardsService boardsService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ReviewsService reviewsService;
	@Autowired
	private MoviesService moviesService;
	@Autowired
	private BookmarksService bookmarksService;
	@Autowired
	private ReportsService reportService;
	@Autowired
	private BookmarksService bookmarkService;
	@Autowired
	private EventsService eventsService;
	@Autowired
<<<<<<< HEAD
	private ContinueMoviesService continueMoviesService;
=======
	private MembersService membersService;
>>>>>>> master
	
	@RequestMapping(value = "/member/{memberNo}/boards/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyBoards(@PathVariable int memberNo, @PathVariable int page){
		
		return boardsService.getMyBoards(memberNo, page);
	}
	
	@RequestMapping(value = "/member/{memberNo}/comments/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyComments(@PathVariable int memberNo, @PathVariable int page){
		
		return commentsService.getMyComments(memberNo, page);
	}
	
	@RequestMapping(value = "/member/{memberNo}/reviews/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyReviews(@PathVariable int memberNo, @PathVariable int page){
		return reviewsService.getMyReviews(memberNo, page);
	}
	
	@RequestMapping(value = "/climingSearch/{title}", method = RequestMethod.GET)
	public List<Movie> getSearchResultForcliming(@PathVariable String title){
		return moviesService.getSearchResultForcliming(title);
	}
	
	@RequestMapping(value="/bookmark/climing", method = RequestMethod.GET)
	public List<Bookmark> getmyBookmarkListForCliming(HttpSession session){
		return bookmarksService.getmyBookmarkListForCliming(session);
	}
	
	@RequestMapping(value="/addBookmarkOfCliming", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String addBookmarkOfCliming(Bookmark bookmark) {
		
		int result = bookmarksService.addBookmarkOfCliming(bookmark);
		
		if(result==1) {
			return "{\"result\":\""+ "성공" +"\"}";
		}else {
			return "{\"result\":\""+ "실패" +"\"}";
		}
		
	}
	@RequestMapping(value="/bookmarkForCliming/{bookNo}", method=RequestMethod.DELETE)
	public String removeBookmarkOfCliming(@PathVariable int bookNo) {
		int result = bookmarksService.removeBookmarkOfCliming(bookNo);
		
		if(result == 1) {
			return "{\"result\":\""+ "성공" +"\"}";
		}else {
			return "{\"result\":\""+ "실패" +"\"}";
		}
	}

	@RequestMapping(value="/getCheckId/email", method=RequestMethod.GET)
	public int getCheckId(String email) {
		
		
		return membersService.getCheckId(email);
	}
	
	@RequestMapping(value="/getCheckNickname/nickname", method=RequestMethod.GET)
	public int getCheckNickname(String nickname) {
		
		return membersService.getCheckNickname(nickname);
	}
	@RequestMapping(value = "/report/climer", method = RequestMethod.GET)
	public void reportClimer(int roomNo,int userNo,String content){
		
		reportService.reportClimer(roomNo,userNo,content);
	}
	@RequestMapping(value = "/addClimingList", method = RequestMethod.GET)
	public void addClimingList(int roomNo,int movieNo){
		
		bookmarkService.addClimingList(roomNo,movieNo);

	}
	@RequestMapping(value="/user/{memberNo}",method=RequestMethod.GET)
	public List<Event> eventsList(int memberNo) {
		return eventsService.getList(memberNo);

	}
	
	
/*근경시작*/

	@RequestMapping(value="/member/{memberNo}/continue",method=RequestMethod.GET)
	public List<ContinueMovie> getContinueList(@PathVariable int memberNo){
		
		System.out.println("//////////AJAX controller///////////////");
		
		System.out.println("memberNo: "+memberNo);
		
		return continueMoviesService.getContinueList(memberNo);
	}
	
/*근경끝*/
	
	
	

}
