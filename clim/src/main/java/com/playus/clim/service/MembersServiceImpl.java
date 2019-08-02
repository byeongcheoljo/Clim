package com.playus.clim.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.MembersDAO;

@Service
public class MembersServiceImpl implements MembersService{
	
	@Autowired
	private MembersDAO membersDAO;
	
	
	@Override
	public Map<String, Object> myPageMember(int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member",membersDAO.myPageMemberSelectOne(memberNo));
	return map;
	}
}
