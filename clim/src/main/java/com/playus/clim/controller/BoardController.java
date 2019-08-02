package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.BoardsService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardsService boardsService;
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardList() {
		
		return "board";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
