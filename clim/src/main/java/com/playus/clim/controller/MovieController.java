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
	@Autowired
	private MoviesService moviesService;
	
	@RequestMapping(value = "/movie/{no}/trailer",method = RequestMethod.GET )
	public String getTrailer(Model model,@PathVariable int no) {
		model.addAllAttributes(moviesService.getMovieTrailer(no));
		return "index";
	}
}
