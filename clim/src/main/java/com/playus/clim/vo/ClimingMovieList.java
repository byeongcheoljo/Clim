package com.playus.clim.vo;

import java.sql.Timestamp;

public class ClimingMovieList {

	
	private int no, climingNo, movieNo;
	private Timestamp regdate;
	
	public ClimingMovieList() {
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
