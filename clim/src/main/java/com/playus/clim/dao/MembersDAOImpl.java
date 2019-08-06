package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;   
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Member;

@Repository
public class MembersDAOImpl implements MembersDAO{
	/* 0803 홍성표 */
	@Autowired
	private SqlSession session;
	
	@Override
	public Member selectOneByNo(int no) {
		return session.selectOne("members.selectOneByNo", no);
	}

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
		return session.insert("members.insertMember",member);
	}
	
	@Override
	public int updateInfo(Member member) {
		// TODO Auto-generated method stub
		return session.delete("members.updateInfo", member);
	}
	@Override
	public Member myPageMemberSelectOne(int memberNo) {
		return session.selectOne("members.myPageMemberSelectOne",memberNo);
	}
	
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
