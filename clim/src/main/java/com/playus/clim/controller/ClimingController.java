package com.playus.clim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.ClimingListsService;
import com.playus.clim.vo.Movie;

@Controller
public class ClimingController {
	@Autowired
	private ClimingListsService climingListService;

	@RequestMapping(value = "/climing", method = RequestMethod.GET)
	public String climingListView() {

		return "climingList";
	};// pageView end

	@MessageMapping("climing/request/feature")
	@SendTo("/topic/climing/set/feature")
	public int subscribingForCliming() {

		
		return 1;
	};// subscribingForCliming()
	
	
	/*
	 * 방장들로부터 현재 영화 시점, 영화 번호, 방번호를 받아 
	*/
	@MessageMapping("/climing/info")
	@SendTo("/topic/climing/get/feature")
	public List<Movie> retrunClimFeature() {
	
		return null;
	};// returnClimFeature()
	
	


}// ClimingController class end
