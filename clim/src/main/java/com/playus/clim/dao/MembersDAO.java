package com.playus.clim.dao;

import com.playus.clim.vo.Member;

public interface MembersDAO {

	public int checkId(String email);
	public int checkNickname(String nickname);
	
	public int insertMember(Member member);
	
}
