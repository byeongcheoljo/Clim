package com.playus.clim.dao;

import com.playus.clim.vo.Member;
<<<<<<< HEAD


public interface MembersDAO {
	
	public int checkId(String email);
	public int checkNickname(String nickname);
	
	public int insertMember(Member member);
	
	public int updateInfo(Member member);

=======

public interface MembersDAO {
	/* 0803 홍성표 */
	public Member selectOneByNo(int no);
>>>>>>> master
	//myPage
	public Member myPageMemberSelectOne(int memberNo);
	//로그인
	public Member selectLogin(Member member);
	
	
	//이메일로 uuid 생성 후 비밀번호 변경홈페이지 링크 보내기
	public int UUIDUpdate(Member member);
	
	//이메일 링크를 클릭하여 비밀번호 변경 홈페이지 띄우기
	public int pwdUpdate(Member member);
	
	public int checkId(String email);
	public int checkNickname(String nickname);
	
	public int insertMember(Member member);
	
	public int updateInfo(Member member);
}
