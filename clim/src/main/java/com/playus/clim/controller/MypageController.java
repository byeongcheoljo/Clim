package com.playus.clim.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playus.clim.service.ClimingMovieListsService;
import com.playus.clim.service.EventsService;
import com.playus.clim.service.MembersService;
import com.playus.clim.service.SubscribesService;
import com.playus.clim.vo.ClimingMovieList;
import com.playus.clim.vo.Event;
import com.playus.clim.vo.Member;

import com.playus.clim.service.MembersService;

@Controller
public class MypageController {

	@Autowired
	private MembersService membersService;
	@Autowired
	private ClimingMovieListsService climingMovieListsService;
	@Autowired
	private SubscribesService subscribesService;
	@Autowired
	private EventsService eventsService;

	@RequestMapping(value = "/user/{memberNo}", method = RequestMethod.GET)
	public String myPage(Model model, @PathVariable int memberNo, HttpSession session) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		int loginMemberNo = loginMember.getNo();
		model.addAttribute("member", membersService.myPageMember(memberNo, loginMemberNo));
		return "mypage";
	}

	@RequestMapping(value = "/ajax/user/{memberNo}/climing", method = RequestMethod.GET)
	@ResponseBody
	public List<ClimingMovieList> myPageClimingMovieList(@PathVariable int memberNo) {
		return climingMovieListsService.myPageClimingList(memberNo);
	}

	@RequestMapping(value = "/ajax/user/following/{loginMember}/follower/{memberNo}", method = { RequestMethod.POST,RequestMethod.DELETE })
	@ResponseBody
	public String subscribes(@PathVariable int loginMember, @PathVariable int memberNo) {
		int count = subscribesService.subscribes(loginMember, memberNo);
		return "{\"count\":" + (count == 0) + "}";
	}

	@RequestMapping(value = "/ajax/user/{memberNo}/events", method = RequestMethod.GET)
	@ResponseBody
	public List<Event> eventsList(@PathVariable int memberNo) {
		return eventsService.getList(memberNo);
	}

	@RequestMapping(value = "/ajax/user/{memberNo}/events", method = RequestMethod.POST)
	@ResponseBody
	public int eventsInsert(Event event, @PathVariable int memberNo) {
		return eventsService.write(event);
	}
	
	@RequestMapping(value = "/ajax/user/{memberNo}/events", method = RequestMethod.DELETE)
	@ResponseBody
	public int eventsDelete(@PathVariable int memberNo) {
		return eventsService.delete(memberNo);
	}
	
	@RequestMapping(value="/user/{memberNo}/community", method=RequestMethod.GET)
	public String myPageCommunity(@PathVariable int memberNo, Model model) {

		model.addAttribute("member", membersService.getMemberByNo(memberNo));
		
		return "mypageCommunity";
	}
	

}
