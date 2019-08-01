package com.playus.clim.vo;

import java.sql.Clob;
import java.sql.Timestamp;

public class Board {

	private int no, memberNo, views;
	private Clob contents;
	private Timestamp regdate;
	
	public Board() {
		// TODO Auto-generated constructor stub
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Clob getContents() {
		return contents;
	}

	public void setContents(Clob contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
