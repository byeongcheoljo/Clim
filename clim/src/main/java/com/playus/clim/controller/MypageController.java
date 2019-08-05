package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.MembersService;
import com.playus.clim.service.PaymentsService;
import com.playus.clim.vo.Payment;

@Controller
public class MypageController {

	@Autowired
	private MembersService membersService;
	@Autowired
	private PaymentsService paymentsService;

	@RequestMapping(value = "/user/{memberNo}", method = RequestMethod.GET)
	public String myPage(Model model, @PathVariable int memberNo) {
		model.addAllAttributes(membersService.myPageMember(memberNo));
		return "mypage";
	}

	@RequestMapping(value = "/user/payment/{no}", method = RequestMethod.GET)
	public String payment(Model model, @PathVariable int no) {

		model.addAttribute("member", paymentsService.getPaymentOne(no));

		return "payment";
	}

	@RequestMapping(value = "/user/payment/{memberNo}", method = RequestMethod.POST)
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

		return "redirect:/user/payment/{memberNo}";
	}
	
	@RequestMapping(value="/user/payment/{memberNo}", method=RequestMethod.DELETE)
	public String payment(@PathVariable int memberNo) {
		 paymentsService.deletePaymentInfo(memberNo);
		return "redirect:/user/payment/{memberNo}";
	}

	@RequestMapping(value="/user/bookmark/{memberNo}",method=RequestMethod.GET)
	public String addList() {
		
		return "bookmark";
		
	}
	
}
