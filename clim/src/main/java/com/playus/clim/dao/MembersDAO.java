package com.playus.clim.dao;

import com.playus.clim.vo.Member;

public interface MembersDAO {
	//로그인
	public Member selectLogin(Member member);
	
	
	//이메일로 uuid 생성 후 비밀번호 변경홈페이지 링크 보내기
	public int UUIDUpdate(Member member);
	
	//이메일 링크를 클릭하여 비밀번호 변경 홈페이지 띄우기
	public int pwdUpdate(Member member);
	
}
