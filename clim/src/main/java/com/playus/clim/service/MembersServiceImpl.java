package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.MembersDAO;
import com.playus.clim.vo.Member;

@Service
public class MembersServiceImpl implements MembersService{
	/* 0802 홍성표 */
	@Autowired
	private MembersDAO membersDAO;
	
	@Override
	public Member getMemberByNo(int no) {
		return membersDAO.selectOneByNo(no);
	}

}
