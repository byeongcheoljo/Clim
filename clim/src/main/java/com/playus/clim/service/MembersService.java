package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.playus.clim.vo.Member;

public interface MembersService {
	
	/* 0802 홍성표 */
	public Member getMemberByNo(int no);

	// 로그인
	public Map<String, Object> login(Member member, HttpSession session);

	// 비밀번호 이메일로 보낼때 유유아이디생성
	public Map<String, Object> UUIDUpdate(Member member);

	public int getCheckId(String email);

	public int getCheckNickname(String nickname);

	public int insertMember(Member member);

	public int updateInfo(Member member);
	
	//이메일 링크 클릭후 비밀번호 변경 홈페이지
	public Map<String, Object> pwdUpdate(Member member);

	// myPage
	public Member myPageMember(int memberNo, int loginMember);
	
	public List<Member> myPageMovieForActors(int no);
	
	public List<Member> myPageMovieFordirectors(int no);
	
	public List<Member> myPageMovieForGenres(int no);
	
	public List<Member> myPageMovieForStriming(int no);
}
