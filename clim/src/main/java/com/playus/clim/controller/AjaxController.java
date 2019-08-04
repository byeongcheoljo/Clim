package com.playus.clim.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.playus.clim.service.BoardsService;
import com.playus.clim.service.CommentsService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.ReviewsService;
import com.playus.clim.vo.Board;
import com.playus.clim.vo.Comment;
import com.playus.clim.vo.Movie;

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
	
	//게시판목록불러오기
	@RequestMapping(value="/boardList/{page}", method=RequestMethod.GET)
	public Map<String, Object> getBoardList(@PathVariable int page){
		return boardsService.getBoardList(page);
	}
	
	@RequestMapping(value="/boardDetail/{no}", method=RequestMethod.GET)
	public Map<String, Object> getBoardDetail(@PathVariable int no){
		
		return boardsService.getBoardDetail(no);
	}
	
	//댓글 작성하기
	@RequestMapping(value="/commentWrite", method=RequestMethod.POST)
	public void commentWrite(Comment comment) {
		
		System.out.println(comment.getMemberNo());
		System.out.println(comment.getContents());
		System.out.println(comment.getBoardNo());
		
		commentsService.insertComment(comment);
	}
	
	//자유게시판 신고하기
	
	@RequestMapping(value="/ajax/boardDetail/reportWrite", method=RequestMethod.POST)
	public void boardReport() {
		
		
	}
	
	//게시글 삭제하기
	@RequestMapping(value="/deleteBoard", method=RequestMethod.POST)
	public void deleteBoard(int no) {
		System.out.println("헤헿?");
		boardsService.deleteBoard(no);
	}
	

}
