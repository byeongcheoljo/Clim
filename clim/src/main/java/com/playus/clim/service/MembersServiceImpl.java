package com.playus.clim.service;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.Map;
=======
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
>>>>>>> master

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.MembersDAO;
<<<<<<< HEAD
=======
import com.playus.clim.vo.Member;
>>>>>>> master

@Service
public class MembersServiceImpl implements MembersService{
	
	@Autowired
	private MembersDAO membersDAO;
	
<<<<<<< HEAD
	
	@Override
	public Map<String, Object> myPageMember(int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member",membersDAO.myPageMemberSelectOne(memberNo));
	return map;
	}
=======
	//로그인
	@Override
	public Map<String, Object> login(Member member, HttpSession session) {
		Member loginMember = membersDAO.selectLogin(member);

		session.setAttribute("loginMember", loginMember);

		System.out.println("서비스" + loginMember);

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		if (loginMember != null && loginMember.getUuid()==null) {
			System.out.println(map);
			map.put("loginMember", loginMember);
		} else {
			map.put("loginMember", 0);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> UUIDUpdate(Member member) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		UUID uuid = UUID.randomUUID();
		String code = uuid.toString();
		//System.out.println("uuid실행될까?"+code);
		member.setUuid(code);
		membersDAO.UUIDUpdate(member);
		//System.out.println("wpqkf!");
		
		map.put("member",member);
		
		return map;
	}
	
	
	@Override
	public Map<String, Object> pwdUpdate(Member member) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		System.out.println(member.getNo()+"22222211111111111111111111111");
		
		String uuid = "";
		member.setUuid(uuid);
		System.out.println(uuid+"uuid 초기화");
		membersDAO.pwdUpdate(member);
		System.out.println(member.getPwd());
		
		return map;
	}
	
>>>>>>> master
}

