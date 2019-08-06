package com.playus.clim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.service.StreamingDetailService;
import com.playus.clim.service.SubscribesService;
import com.playus.clim.vo.Subscribe;

@Controller
public class StreamingController {
	@Autowired
	private StreamingDetailService streamingDetailService;
	@Autowired
	private SubscribesService subscribesService;
	
	@RequestMapping(value="/room/{no}", method=RequestMethod.GET)
	public String getModelPage(Model model, @PathVariable int no) {
		System.out.println(no);
		model.addAllAttributes(streamingDetailService.getDetailByRoomNo(no));
		return "streamingDetail";
	}
	
	@RequestMapping(value="/ajax/user/{memberNo}/subscribe",method=RequestMethod.GET)
	@ResponseBody
	public List<Subscribe> getSubscribeList(@PathVariable int memberNo){
		return subscribesService.getList(memberNo);
	}
}
