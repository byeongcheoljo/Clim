package com.playus.clim.controller;

import java.util.List; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
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

import com.playus.clim.service.BookmarksService;
import com.playus.clim.service.PaymentsService;
import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Payment;

@Controller
public class MypageController {

	@Autowired
	private MembersService membersService;
	@Autowired
	private PaymentsService paymentsService;
	@Autowired
	private BookmarksService bookmarksService;
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
	
	@RequestMapping(value = "/user/{memberNo}/payment", method = RequestMethod.GET)
	public String payment(Model model, @PathVariable int memberNo) { 
		System.out.println("payment"+memberNo);
		model.addAttribute("member", paymentsService.getPaymentOne(memberNo));

		return "payment";
	}

	@RequestMapping(value = "/user/{memberNo}/payment", method = RequestMethod.POST)
	public String payment(Payment payment, @PathVariable int memberNo, String cardNum1, String cardNum2, String cardNum3, 
			String cardNum4, String validMonth, String validYear, String pwd, String cvc, int card) {

		//카드 번호 합치기
		String fullCardNum = cardNum1 + cardNum2 + cardNum3 + cardNum4;
		//카드 유효 (년,월) 합치기
		String fullVaildDate = validMonth + validYear;
		
		System.out.println("grade : "+payment.getGrade());
		System.out.println("카드이름:"+ payment.getCardName());
		payment.setMemberNo(memberNo);
		payment.setCardNo(fullCardNum);
		payment.setCardVaildate(fullVaildDate);
		payment.setCardPW(pwd);
		payment.setCardCVC(cvc);	
		payment.setCardName(card);
		
		
		//payment.setGrade(grade);
		
		

		System.out.println(payment.getCardCVC());
		System.out.println(payment.getCardName());
		System.out.println(payment.getCardNo());
		System.out.println(payment.getCardPW());
		System.out.println(payment.getCardVaildate());
		System.out.println(payment.getGrade());
		System.out.println(payment.getMemberNo());
		System.out.println(payment.getNo());
		System.out.println(payment.getRegdate());
		System.out.println(fullCardNum);
		
		paymentsService.updatePaymentInfo(payment);

		return "redirect:/user/{memberNo}/payment";
	}
	
	@RequestMapping(value="/user/{memberNo}/payment", method=RequestMethod.DELETE)
	public String payment(@PathVariable int memberNo) {
		 paymentsService.deletePaymentInfo(memberNo);
		return "redirect:/user/{memberNo}/payment";
	}

	@RequestMapping(value="/user/{memberNo}/bookmark",method=RequestMethod.GET)
	public String addList() {
		
		return "bookmark";
		
		
	}
	
	@RequestMapping(value="/user/{memberNo}/info", method=RequestMethod.GET)
	public String pwdUpdate(HttpSession session, @PathVariable int memberNo) { 
		
		
		
		return "myPageInformation";
	}
	
	@RequestMapping(value="/user/{memberNo}/info", method=RequestMethod.POST)
	public String pwdUpdate(Member member, @PathVariable int memberNo, @RequestHeader String referer) { 
	
		membersService.updateInfo(member);
		System.out.println(member.getPwd());
		
		
		return "redirect:"+referer;
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
