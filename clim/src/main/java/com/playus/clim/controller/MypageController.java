package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.MembersService;

@Controller
public class MypageController {
	
	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/mypage/{memberNo}/community", method=RequestMethod.GET)
	public String myPageCommunity(@PathVariable int memberNo, Model model) {

		model.addAttribute("member", membersService.getMemberByNo(memberNo));
		
		return "mypageCommunity";
	}
	

}
