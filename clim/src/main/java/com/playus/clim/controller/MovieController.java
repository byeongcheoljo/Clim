package com.playus.clim.controller;

import java.util.Map; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.service.BookmarksService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.vo.Member;

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
}
