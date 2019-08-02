package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Member;

@Repository
public class MembersDAOImpl implements MembersDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Member selectLogin(Member member) {
		return session.selectOne("members.selectLogin", member);
	}
	
	@Override
	public int UUIDUpdate(Member member) {
		// TODO Auto-generated method stub
		return session.update("members.UUIDUpdate",member);
	}
	
	@Override
	public int pwdUpdate(Member member) {
		// TODO Auto-generated method stub
		return session.update("members.pwdUpdate", member);
	}

}
