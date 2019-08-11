package com.playus.clim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.MoviesService;

@Controller
public class MovieController {
	// 재현
	@Autowired
	private MoviesService moviesService;

	@RequestMapping(value="/movie/{no}", method=RequestMethod.GET)
	public String movieDetail(@PathVariable int no, Model model, HttpSession session) {
		
		//Member loginMember = (Member) session.getAttribute("loginMember");
		
		int loginMember = 1;
		
		model.addAllAttributes(moviesService.getMovieDetail(no, loginMember));
		
		return "movieDetail";
	}
	// 재현
}
