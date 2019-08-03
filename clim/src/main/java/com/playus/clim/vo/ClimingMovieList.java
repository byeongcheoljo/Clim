package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingMovieList {

	private int no, climingNo, movieNo, memberNo;
	private String poster;
	private Timestamp regdate;

	public ClimingMovieList() {
		// TODO Auto-generated constructor stub
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
}
