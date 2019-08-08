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

	/* web socket */
	// 시청자로부터 방 번호를 받아 방장들에게 브로드캐스팅
	@MessageMapping("/climing/{climNo}/request/feature")
	@SendTo("/climing/get/feature") // 이 주소를 가진 방장에게 broadCast
	public int subscribingForCliming(@DestinationVariable int climNo) {

		System.out.println("current climNo : " + climNo);
		// List<ClimingList> climingList =
		// climingListService.getClimRealtimeFeature(climNo);
		return climNo;
	};// subscribingForCliming()

	
	
	/*
	 * 방장들로부터 현재 영화 시점, 영화 번호를 받아 처리하여 시청자들에게 스틸컷, 장르, 포스터를 브로드캐스팅
	 */
	@MessageMapping("/climing/respond/feature/currentTime/{currentTime}/movie/{movieNo}")
	@SendTo("/topic/climing/set/feature")
	public List<Movie> retrunClimFeature(@DestinationVariable int currentTime, @DestinationVariable int movieNo) {
		// mapper미작성 : 질문할 것
		List<Movie> movies = climingListService.getClimRealtimeFeature();

		return movies;
	};// returnClimFeature()

}// ClimingController class end
