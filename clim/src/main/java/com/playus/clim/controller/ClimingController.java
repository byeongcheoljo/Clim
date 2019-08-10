package com.playus.clim.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.ClimingListsService;
import com.playus.clim.util.SnapshotCreateUtil;
import com.playus.clim.vo.Clim;
import com.playus.clim.vo.Movie;

@Controller
public class ClimingController {
	@Autowired
	private ClimingListsService climingListService;
	@Autowired
	private SnapshotCreateUtil snapshotCreateUtil;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = "/climing", method = RequestMethod.GET)
	public String climingListView() {
		
		System.out.println("/climing :"+servletContext);

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
	public Clim retrunClimFeature(Clim clim) throws Exception {
		
//		int roomNo = clim.getNo();
//		System.out.println("방번호 : "+roomNo);
//		System.out.println("영화경로 : "+clim.getSrc());
//		System.out.println("현재 시점 : "+clim.getCurrentTime());
		//방번호로 영화번호를 가져와야 함
		
		String src = clim.getSrc();
		src = src.substring(7);
		
		System.out.println(src);
		
		Clim movieFeature = climingListService.getClimRealtimeFeature(src);
//		System.out.println(movieFeature);
//		System.out.println("/climing/info");
//		System.out.println("no:"+movieFeature.getNo());
		System.out.println("Poster:"+movieFeature.getPoster());
		System.out.println("genre:"+movieFeature.getGenre());
		System.out.println("title:"+movieFeature.getTitle());
		System.out.println("viewerCount :" +clim.getViewerCount());
		movieFeature.setViewerCount(clim.getViewerCount());
		//movieFeature.setCurrentTime(clim.getCurrentTime());
		
		
		
		//영화가 있는 폴더 경로
				String moviePath = servletContext.getRealPath("video");
				//스냅샷 찍을 폴더 경로
				String snapshotPath = servletContext.getRealPath("snapshot");
		
		String inputFilename = moviePath+File.separator +src;
		
		System.out.println(inputFilename);
		
		long timestamp = Long.valueOf(clim.getCurrentTime()*1000);// 세컨드를 밀리세컨드로 
		
		File outputDir = new File(snapshotPath);
		String snapshotPrefix = ""+movieFeature.getNo();
		
		int maxHeight = 230;
		int maxWidth = 354;
		
		snapshotCreateUtil.makeSnapshots(inputFilename, timestamp, outputDir, snapshotPrefix, maxWidth, maxHeight);
		
		movieFeature.setStealcut(snapshotPrefix+timestamp+".jpg");
		
		
		return movieFeature;
	};// returnClimFeature()
	
	


}// ClimingController class end
