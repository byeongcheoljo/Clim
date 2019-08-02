package com.playus.clim.service;

import java.util.Map;
<<<<<<< HEAD

public interface MembersService {
	public Map<String, Object> myPageMember(int memberNo);
=======

import javax.servlet.http.HttpSession;

import com.playus.clim.vo.Member;

public interface MembersService {
	//로그인
	public Map<String, Object> login(Member member, HttpSession session);
	
	//비밀번호 이메일로 보낼때 유유아이디생성
	public Map<String, Object> UUIDUpdate(Member member);

	//이메일 링크 클릭후 비밀번호 변경 홈페이지
	public Map<String, Object> pwdUpdate(Member member);
>>>>>>> master
}
