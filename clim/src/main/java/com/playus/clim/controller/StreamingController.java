package com.playus.clim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
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
import com.playus.clim.service.ClimingListsService;
import com.playus.clim.vo.ClimingList;

@Controller
public class StreamingController {
	@Autowired
	private StreamingDetailService streamingDetailService;
	@Autowired
	private SubscribesService subscribesService;
	@Autowired
	private ClimingListsService climingListsService;
	
	
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
	};
	
	@MessageMapping("/clim/make")
	@SendToUser("/queue/clim/make")
	public int asdsdfaasdfasdf(ClimingList climingList, SimpMessageHeaderAccessor accessor) {
		
		// sessionId : accessor.getSessionId(); 
		// 고유한 값
		String sessionId = accessor.getSessionId();
		
		System.out.println("/app/clim/make");
		//clim 생성
		climingList.setSessionId(sessionId);
		try {
			climingListsService.make(climingList);
		}catch(Exception e) {
			e.printStackTrace();
		}//try~catch end
		// 방번호를 알 수 있음
		System.out.println("no : "+climingList.getNo());
		// 방번호를 리턴
		return climingList.getNo();
	}
	@MessageMapping("/room/{no}/chat")
	@SendTo("/topic/room/{no}/chat")
	public String asapqkfkeo(String msg, SimpMessageHeaderAccessor accessor) {
		System.out.println(msg);
		return msg;
	}
	
	@MessageMapping("/clim/list")
	@SendTo("/topic/clim/list")
	public List<ClimingList> subscribeList(SimpMessageHeaderAccessor accessor) {
		return climingListsService.subscribesClimingList();
	}
}
