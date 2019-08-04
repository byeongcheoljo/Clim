package com.playus.clim.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
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
	
	
	@MessageMapping("/room/{no}/chat")
	@SendTo("/topic/room/{no}/chat")
	public String asdfas(String msg, 
			SimpMessageHeaderAccessor accessor) {
		
		System.out.println(msg);
		
		return msg;
	}
	
	
	@MessageMapping("/room/{no}/close")
	@SendTo("/topic/room/{no}/close")
	public int asdfas( 
			SimpMessageHeaderAccessor accessor) {
		
		System.out.println(accessor.getSessionId());
		
		System.out.println("방장이 문을 닫았음");
		
		//climListService.close(accessor.getSessionId());
		
		return 1;
	}
	//방에서 현재 시간을 얻어옴
		@MessageMapping("/room/{no}/get/time")
		@SendTo("/topic/room/{no}/get/time")
		public int afdasdf(SimpMessageHeaderAccessor accessor) {
			System.out.println("/room/{no}/get/time");
			
			//아무값이나 리턴하지 않으면 응답이 가지 않음
			return 1;
		}
		
		//방에서 현재 시간을 세팅함
		@MessageMapping("/room/{no}/set/time")
		@SendTo("/topic/room/{no}/set/time")
		public double afdasdf(Double time, SimpMessageHeaderAccessor accessor) {
			System.out.println("/room/{no}/set/time");
			System.out.println(time);
			return time;
		}
		@MessageMapping("/room/{no}/put/sessionId")
		public void sfasds(int no,SimpMessageHeaderAccessor accessor) {
			System.out.println("방장이 처음 들어옴!");
			
			System.out.println("sessionId:"+accessor.getSessionId());
			
//			Clim clim = new Clim(no,accessor.getSessionId());
//			
//			climListService.updateSessionId(clim);
		}
		
		

}
