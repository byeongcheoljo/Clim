package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingLog {

	private int no, climingNo, memberNo;
	private char type;
	
	private Timestamp regdate;
	
	
	public ClimingLog() {
		// TODO Auto-generated constructor stub
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
	
	
	
	
	
}
