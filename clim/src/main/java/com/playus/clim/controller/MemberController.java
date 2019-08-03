package com.playus.clim.controller;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.MembersService;
import com.playus.clim.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String signUp() {
		
		return "signup";
	}
	
	@RequestMapping(value="/survey", method=RequestMethod.GET)
	public String survey() {
		
		
		return "survey";
	}
	
	
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String signUp(Member member, String year, String month, String date) {
		System.out.println(member.getNo());
		System.out.println(member.getEmail());
		System.out.println(member.getGender());
		System.out.println(member.getNickname());
		
		Date birthdate = Date.valueOf(year+"-"+month+"-"+date);
		
		member.setBirthDate(birthdate);
		
		membersService.insertMember(member);
		
		
		
		return "redirect:survey";
	}
	
	
	@RequestMapping(value="/user", method=RequestMethod.GET)
	public String pwdUpdate(HttpServletRequest request) {
		
		
		
		
		Member member = new Member();
		member.setNo(3);
		member.setBirthDate(Date.valueOf("2019-01-01"));
		member.setEmail("test@gmail.net");
		member.setGender('M');
		member.setNickname("Â¯¾Æ");		
		member.setPwd("123123123");
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		
		return "myPageInformation";
	}
	
	
	@RequestMapping(value="/user", method=RequestMethod.POST)
	public String pwdUpdate(Member member) {
		
		
		
		membersService.updateInfo(member);
		System.out.println(member.getPwd());
		
		
		
		return "redirect:index";
	}
	
}
