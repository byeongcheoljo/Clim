package com.playus.clim.service;

import com.playus.clim.vo.Member;

public interface MembersService {

	public int getCheckId(String email);
	public int getCheckNickname(String nickname);
	public int insertMember(Member member);
	
	public int updateInfo(Member member);
	
}
