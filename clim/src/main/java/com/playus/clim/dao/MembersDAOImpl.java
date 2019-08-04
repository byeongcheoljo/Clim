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

}
