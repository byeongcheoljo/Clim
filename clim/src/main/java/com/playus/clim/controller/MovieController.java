package com.playus.clim.controller;

import java.util.Map; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.service.BookmarksService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;

@Controller
public class MovieController {
	@Autowired
	private MoviesService moviesService;
	@Autowired
	private BookmarksService bookmarksService;
	
	
	@RequestMapping(value = "/ajax/movie/{movieNo}/trailer",method = RequestMethod.GET )
	@ResponseBody
	public Map<String, Object> getTrailer(@PathVariable int movieNo,HttpSession session){
		Member member= (Member)session.getAttribute("loginMember");
		int memberNo;
		
		if(member!=null) {
		memberNo = member.getNo(); 
		}else {
		memberNo = 0;
		}
		return moviesService.getMovieTrailer(movieNo,memberNo);
	}
	
	@RequestMapping(value = "/ajax/movie/{movieNo}/bookmark/{memberNo}",method = { RequestMethod.POST, RequestMethod.DELETE })
	@ResponseBody
	public String bookmarkCheck(@PathVariable int movieNo,@PathVariable int memberNo) {
		int count = bookmarksService.bookmarkForMovie(movieNo,memberNo);
		return "{\"count\":"+(count == 1)+"}";
	}
	
	@RequestMapping(value = "/player/movie/{movieNo}" , method =RequestMethod.GET )
	public String playMovie(@PathVariable int movieNo, Model model) {
		
		Movie movie = moviesService.getMovie(movieNo);
		System.out.println(movie.getNo());
		System.out.println(movie.getTitle());
		System.out.println(movie.getSrc());
		
		model.addAttribute(movie);
		
		return "player";
	}
	
	
	@RequestMapping(value="/movie/{no}", method=RequestMethod.GET)
	public String movieDetail(@PathVariable int no, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginMember");
		int loginMember = member.getNo();
		
		System.out.println("MovieController loginMember:"+loginMember);
		
		model.addAllAttributes(moviesService.getMovieDetail(no, loginMember));
		
		return "movieDetail";
	}
	// 재현
}
