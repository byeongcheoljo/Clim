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
import com.playus.clim.service.MembersService;
import com.playus.clim.vo.ClimingMovieList;
import com.playus.clim.vo.Member;

@Controller
public class MypageController {
	
	@Autowired
	private MembersService membersService;
	@Autowired
	private ClimingMovieListsService climingMovieListsService;
	
	@RequestMapping(value="/user/{memberNo}",method=RequestMethod.GET)
	public String myPage(Model model,@PathVariable int memberNo,HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		int loginMemberNo = loginMember.getNo();
		
		model.addAllAttributes(membersService.myPageMember(memberNo,loginMemberNo));
		return "mypage";
	}
	
	@RequestMapping(value = "/ajax/user/{memberNo}/climing",method = RequestMethod.GET)
	@ResponseBody
	public List<ClimingMovieList> myPageClimingMovieList(@PathVariable int memberNo){
		return climingMovieListsService.myPageClimingList(memberNo);
	}
}
