package com.playus.clim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ClimingController {
	

	@RequestMapping(value="/climing", method=RequestMethod.GET)
	public String climingListView() {
		
		return "climingList";
	};//pageView end
}
