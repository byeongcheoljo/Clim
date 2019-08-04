package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.MoviesService;

@Controller
public class IndexController {
	
	@Autowired
	private MoviesService moviesService;

	@RequestMapping(value= {"/", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("climedOne",moviesService.getClimedList());//끌림작
		model.addAllAttributes(moviesService.getRecommandationList());//추천작1~3
		
		return "index";
	}

}
