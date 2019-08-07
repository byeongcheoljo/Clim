package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingList {

<<<<<<< HEAD
	private int no, memberNo, viewerCount;
	private String title, nickname;
	private Timestamp regdate;
=======
	private int no, memberNo;
	private String title, sessionId;
	private Timestamp regdate, openTime, closeTime;
>>>>>>> master

	public ClimingList() {
		// TODO Auto-generated constructor stub
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


	public Timestamp getOpenTime() {
		return openTime;
	}

	public void setOpenTime(Timestamp openTime) {
		this.openTime = openTime;
	}

	public Timestamp getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(Timestamp closeTime) {
		this.closeTime = closeTime;
	}

	
	
	public int getViewerCount() {
		return viewerCount;
	}



	public void setViewerCount(int viewerCount) {
		this.viewerCount = viewerCount;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
