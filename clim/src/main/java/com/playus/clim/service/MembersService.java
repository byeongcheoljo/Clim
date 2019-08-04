package com.playus.clim.service;

<<<<<<< HEAD
=======
import java.util.Map; 

import javax.servlet.http.HttpSession;

>>>>>>> master
import com.playus.clim.vo.Member;

public interface MembersService {
	
	//로그인
	public Map<String, Object> login(Member member, HttpSession session);
	
	//비밀번호 이메일로 보낼때 유유아이디생성
	public Map<String, Object> UUIDUpdate(Member member);

<<<<<<< HEAD
	public int getCheckId(String email);
	public int getCheckNickname(String nickname);
	public int insertMember(Member member);
	
	public int updateInfo(Member member);
	
=======
	//이메일 링크 클릭후 비밀번호 변경 홈페이지
	public Map<String, Object> pwdUpdate(Member member);
	
	//myPage
<<<<<<< HEAD
	public Member myPageMember(int memberNo,int loginMember);
=======
	public Map<String, Object> myPageMember(int memberNo);
>>>>>>> master
>>>>>>> master
}
