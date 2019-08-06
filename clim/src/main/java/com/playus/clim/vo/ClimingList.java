package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingList {

	private int no, memberNo;
<<<<<<< HEAD
	private String title, sessionId;
	private Timestamp regdate, closeTime;
=======
	private String title;
	private Timestamp openTime, closeTime;
>>>>>>> master

	public ClimingList() {
		// TODO Auto-generated constructor stub
	}
	
	

	public String getSessionId() {
		return sessionId;
	}



	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


	


	public Timestamp getCloseTime() {
		return closeTime;
	}



	public void setCloseTime(Timestamp closeTime) {
		this.closeTime = closeTime;
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
