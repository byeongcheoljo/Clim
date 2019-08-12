package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingLog {

	private int no, climingNo, memberNo;
	private char type;
	private String sessionId, msg, nickname;
	private Timestamp openDate,closeDate;
	
	private Timestamp regdate;
	
	
	public ClimingLog() {
		// TODO Auto-generated constructor stub
	}
	

	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getClimingNo() {
		return climingNo;
	}


	public void setClimingNo(int climingNo) {
		this.climingNo = climingNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public char getType() {
		return type;
	}


	public void setType(char type) {
		this.type = type;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getSessionId() {
		return sessionId;
	}


	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


	public Timestamp getOpenDate() {
		return openDate;
	}


	public void setOpenDate(Timestamp openDate) {
		this.openDate = openDate;
	}


	public Timestamp getCloseDate() {
		return closeDate;
	}


	public void setCloseDate(Timestamp closeDate) {
		this.closeDate = closeDate;
	}
	
	
	
	
	
}
