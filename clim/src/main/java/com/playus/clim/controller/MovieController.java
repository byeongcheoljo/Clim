package com.playus.clim.controller;

import java.util.Map; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.service.MoviesService;

@Controller
public class MovieController {
	@Autowired
	private MoviesService moviesService;
	
	@RequestMapping(value = "/ajax/movie/{movieNo}/trailer",method = RequestMethod.GET )
	@ResponseBody
	public Map<String, Object> getTrailer(@PathVariable int movieNo){
		return moviesService.getMovieTrailer(movieNo);
	}
}
