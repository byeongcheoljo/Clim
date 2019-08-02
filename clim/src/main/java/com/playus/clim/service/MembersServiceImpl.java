package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.MembersDAOImpl;
import com.playus.clim.vo.Member;

@Service
public class MembersServiceImpl implements MembersService{

	@Autowired
	private MembersDAOImpl memberDaoImpl;
	
	@Override
	public int getCheckId(String email) {
		// TODO Auto-generated method stub
		return memberDaoImpl.checkId(email);
	}
	
	@Override
	public int getCheckNickname(String nickname) {
		// TODO Auto-generated method stub
		return memberDaoImpl.checkNickname(nickname);
	}
	
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return memberDaoImpl.insertMember(member);
	}
}
