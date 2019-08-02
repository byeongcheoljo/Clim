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
	public Member myPageMemberSelectOne(int memberNo) {
		return session.selectOne("members.myPageMemberSelectOne",memberNo);
	}
}
