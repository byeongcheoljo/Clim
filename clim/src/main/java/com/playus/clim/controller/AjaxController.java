package com.playus.clim.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.playus.clim.service.BoardsService;
import com.playus.clim.service.BookmarksService;
import com.playus.clim.service.CommentsService;
import com.playus.clim.service.LikesService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.ReportsService;
import com.playus.clim.service.ReviewsService;
import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Like;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Report;
import com.playus.clim.vo.Review;

@RestController
@RequestMapping(value = "/ajax")
public class AjaxController {
	
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
	private ReportsService reportsService;
	@Autowired
	private LikesService likesService;
	
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

	//재현
	@RequestMapping(value="/movie/{movieNo}/review/page/{page}", method=RequestMethod.GET)
	public Map<String, Object> getReviewList(@PathVariable int movieNo, @PathVariable int page, Report report, Like like) {
		
		return reviewsService.getReviewList(movieNo, page, report, like);
	}
	
	@RequestMapping(value="/movie/{movieNo}/review", method=RequestMethod.POST)
	public Map<String, Object> registerReview(Review review) {
		
		return reviewsService.registerReview(review);
	}
	
	@RequestMapping(value="/movie/{movieNo}/bookmark", method=RequestMethod.POST)
	public Map<String, Object> addMovie(@RequestBody Bookmark bookmark) {
		return bookmarksService.addMovie(bookmark);
	}
	
	@RequestMapping(value="/movie/{movieNo}/bookmark", method=RequestMethod.DELETE)
	public int deleteMovie(@RequestBody Bookmark bookmark) {
		return bookmarksService.deleteMovie(bookmark);
	}
	
	@RequestMapping(value="/movie/{movieNo}/spoiler", method=RequestMethod.POST)
	public int reportSpoiler(Report report) {
		return reportsService.reportSpoiler(report);
	}
	
	@RequestMapping(value="/movie/{movieNo}/spoiler", method=RequestMethod.GET)
	public int deleteMyReview (int no) {
		return reviewsService.deleteMyReview(no);
	}
	
	@RequestMapping(value = "/movie/{movieNo}/like", method = RequestMethod.POST)
	public int insertLike(Like like) {
		return likesService.insertLike(like);
	}
	
	@RequestMapping(value = "/movie/{movieNo}/like", method = RequestMethod.GET)
	public int deleteLike(Like like) {
		return likesService.deleteLike(like);
	}
}
