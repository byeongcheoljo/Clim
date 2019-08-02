package com.playus.clim.controller;

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
	public String movieDetail(@PathVariable int no, Model model) {
		
		model.addAllAttributes(moviesService.getMovieDetail(no));
		
		return "movieDetail";
	}
	// 재현
	
}
