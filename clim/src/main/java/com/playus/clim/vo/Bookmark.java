package com.playus.clim.vo;

import java.sql.Timestamp;

public class Bookmark {

	private int no, memberNo, movieNo;
	private String title, poster;
	private Timestamp regdate;
	
	private char type;
	
	
	public Bookmark() {
		// TODO Auto-generated constructor stub
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
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


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public char getType() {
		return type;
	}


	public void setType(char type) {
		this.type = type;
	}
	
}
