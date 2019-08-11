package com.playus.clim.vo;

import java.sql.Timestamp;

public class Like {

	
	private int no, postNo, memberNo;
	private char emotion, type;
	private Timestamp regdate;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public char getEmotion() {
		return emotion;
	}

	public void setEmotion(char emotion) {
		this.emotion = emotion;
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
