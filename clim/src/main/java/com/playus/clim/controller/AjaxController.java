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
import com.playus.clim.service.ClimingListsService;
import com.playus.clim.service.BookmarksService;

import com.playus.clim.service.ClimingLogsService;
import com.playus.clim.service.ClimingMovieListsService;

import com.playus.clim.service.CommentsService;
import com.playus.clim.service.ContinueMoviesService;
import com.playus.clim.service.MembersService;
import com.playus.clim.service.EventsService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.ReportsService;
import com.playus.clim.service.ReviewsService;

import com.playus.clim.vo.ClimingList;
import com.playus.clim.service.SurveysService;
import com.playus.clim.vo.ContinueMovie;
import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Event;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Survey;

import com.playus.clim.service.SubscribesService;
import com.playus.clim.vo.Event;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Subscribe;


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
	private ClimingListsService climingListsService;
	@Autowired
	private BookmarksService bookmarksService;
	@Autowired
	private ReportsService reportService;
	@Autowired
	private BookmarksService bookmarkService;
	@Autowired
	private EventsService eventsService;
	@Autowired

	private ContinueMoviesService continueMoviesService;
	@Autowired
	private MembersService membersService;
	
	@Autowired
	private SurveysService surveysService;
	

	private ClimingMovieListsService climingMovieListsService;
	@Autowired
	private SubscribesService subscribesService;

	
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
/* -------------------------------------------Sohn-------------------------------------------*/
	@RequestMapping(value="/climing", method=RequestMethod.GET)
	public List<ClimingList> getClimingList(){
		return climingListsService.getClimingList();
	}
/* -------------------------------------------//Sohn-------------------------------------------*/
	
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
	public String addClimingList(int roomNo,int movieNo){
		
		return bookmarkService.addClimingList(roomNo, movieNo);

	}
	@RequestMapping(value="/user/{memberNo}",method=RequestMethod.GET)
	public List<Event> eventsList(int memberNo) {
		return eventsService.getList(memberNo);

	}
	

	@RequestMapping(value="/user/{memberNo}/bookmark", method=RequestMethod.GET)
	public List<Bookmark> getMovieBookmarkList(@PathVariable int memberNo){
		
		return  bookmarkService.getMyMovieList(memberNo);
		
	}
	
	@RequestMapping(value="/user/{memberNo}/bookmark/{no}",method=RequestMethod.DELETE)
	public String deleteList(@PathVariable int memberNo, @PathVariable int no) {
		int result = bookmarkService.deletMybookmarkMovie(no);
		
		return "{\"result:"+result+"\"}";
		
	}

	
	@RequestMapping(value="/user/{memberNo}/survey", method=RequestMethod.GET)
	public List<Survey> selectSurveyList(int page, @PathVariable int memberNo){
		
		
		return surveysService.selectSurveyList(page);
	}
	
	@RequestMapping(value="/user/{memberNo}/survey/{movieNo}/score/{score}", method=RequestMethod.POST)
	public String insertMovieRate(Survey survey, @PathVariable int memberNo, @PathVariable int movieNo, @PathVariable int score) {
		System.out.println(memberNo);
		System.out.println(movieNo);
		int result= surveysService.insertMovieRate(survey);
		
		return "{\"result:"+result+"\"}";
	}
	
	
	@RequestMapping(value="/user/{memberNo}/survey/{movieNo}/score/{score}", method=RequestMethod.PUT)
	public String updateMovieRate(Survey survey, @PathVariable int memberNo, @PathVariable int movieNo, @PathVariable int score) {
		System.out.println(memberNo);
		System.out.println(movieNo);
		int result= surveysService.updateMovieRate(survey);
		
		return "{\"result:"+result+"\"}";
	
	}
	
	
	
/*근경시작*/
	//index에서 이어보기
	@RequestMapping(value="/member/{memberNo}/continue",method=RequestMethod.GET)
	public List<ContinueMovie> getContinueList(@PathVariable int memberNo){
		return continueMoviesService.getContinueList(memberNo);
	}
	
/*근경끝*/

	@RequestMapping(value = "/delete/ClimingList", method = RequestMethod.GET)
	public void deleteClimingList(int roomNo,int movieNo){
		
		
		bookmarkService.deleteClimingList(roomNo,movieNo);

	}
	@RequestMapping(value = "/room/{roomNo}/ClimingMovie/{movieNo}", method = RequestMethod.GET)
	public void insertClimingMovieList(@PathVariable int roomNo,@PathVariable int movieNo){
		
		
		climingMovieListsService.insertPlayedMovie(roomNo,movieNo);
	}
	
	@RequestMapping(value="/subscribe/follow", method=RequestMethod.POST)
	public void insertFollow(Subscribe subscribe) {
		System.out.println(subscribe.getFollowing());
		System.out.println(subscribe.getFollower());
		subscribesService.addFollow(subscribe);
	}
	
	@RequestMapping(value="/subscribe/follow", method=RequestMethod.GET)
	public void deleteFollow(Subscribe subscribe) {
		System.out.println(subscribe.getFollowing());
		System.out.println(subscribe.getFollower());
		subscribesService.removeFollow(subscribe);
	}

	
}





