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
	public int checkId(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("members.checkId",email);
	}
	
	@Override
	public int checkNickname(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("members.checkNickname", nickname);
	}
	
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return session.insert("members.insert",member);
	}
}
