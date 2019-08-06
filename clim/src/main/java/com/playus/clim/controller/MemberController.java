package com.playus.clim.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		member.setNickname("짱아");		
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
	
	//로그인
	@ResponseBody
	@RequestMapping(value="/ajax/session", method=RequestMethod.POST)
	public Map<String, Object> login(Member member, @RequestHeader String referer, HttpSession session,
			RedirectAttributes ra) {
//		미안해 규범아..........
//		정말 열심히 해보았지만 모르겠어.........
		return membersService.login(member, session);
	}
	
	//로그아웃
	@RequestMapping(value="/session", method=RequestMethod.DELETE)
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/index";
	}
	
	//이메일인증
	@ResponseBody
	@RequestMapping(value="/ajax/findPwd", method=RequestMethod.POST)
	public Map<String, Object> mailSender(String email, HttpServletRequest request, ModelMap mo, Member member) throws UnknownHostException { 
		// 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
		//System.out.println(member2.getEmail());
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map = membersService.UUIDUpdate(member);
		
		System.out.println(member.getNo());
		
		Member member2 = (Member)map.get("member");
		System.out.println(member2.getNickname()+"123456789123456789"+member2.getEmail());
		//System.out.println(member2);
		//System.out.println("야! 하선아"+member2.getNo());
		String ip = InetAddress.getLocalHost().getHostAddress();
		String host = "smtp.naver.com"; 
		final String username = "rbqja1798";
		//네이버 아이디를 입력해주세요. @naver.com은 입력하지 마시구요. 
		final String password = "1q2w3e4r1!"; //네이버 이메일 비밀번호를 입력해주세요
		int port=465; //포트번호 // 메일 내용 
		String recipient = member2.getEmail(); //받는 사람의 메일주소를 입력해주세요.
		String subject = "끌리밍 비밀번호 찾기"; //메일 제목 입력해주세요. 
		String manager = "관리자";
		String body = "<h2>끌리밍 비밀번호 찾기 링크입니다 .</h2>"
				+ "<br/><h3> 아래의 링크를 클릭하여 비밀번호 변경을 해주세요.</h3>"
				+"<br/><a href=\"http://"+ip+"/pwdUpdate/"+member2.getNo()+"/code/"+member2.getUuid()+"\">비밀번호 변경 페이지로 가기</a>";
		//메일 내용 입력해주세요. 
		//System.out.println(member.getUuid()+"변경된 유유아아아아아ㅏ아이디");
		Properties props = System.getProperties(); 
		// 정보를 담기 위한 객체 생성 
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host); //Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		try {
			mimeMessage.setFrom(new InternetAddress("rbqja1798@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
			mimeMessage.setSubject(subject); //제목셋팅 
			//mimeMessage.setText(body); //내용셋팅
			mimeMessage.setContent(body,"text/html; charset=UTF-8"); //내용셋팅 (마크업을 사용하기위해 setText가 아니라 setContent사용) 
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
			System.out.println("test");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	//비밀번호 변경홈페이지
	@RequestMapping(value="/pwdUpdate/{no}/code/{uuid}", method=RequestMethod.GET)
	public String passwordUpdateForm(@PathVariable int no, @PathVariable String uuid) {
		
		return "pwdUpdate";
	}
	
	//비밀번호 변경 시
	@RequestMapping(value="/pwdUpdate/reset", method=RequestMethod.POST)
	public String passwordUpdate(Member member, RedirectAttributes ra) {
		membersService.pwdUpdate(member);

		
		return "redirect:/index";
	}
}
