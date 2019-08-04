package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.StreamingDetailService;

@Controller
public class StreamingController {
	@Autowired
	private StreamingDetailService streamingDetailService;
	
	
	@RequestMapping(value="/room/{no}", method=RequestMethod.GET)
	public String getModelPage(Model model, @PathVariable int no) {
		System.out.println(no);
		model.addAllAttributes(streamingDetailService.getDetailByRoomNo(no));
		
		return "streamingDetail";
		
	}

}
