package com.playus.clim.vo;

import java.sql.Timestamp;

public class DirectorMovie {
	private int no, movieNo,directorNo;
	private Timestamp regdate;
	
	public DirectorMovie() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getDirectorNo() {
		return directorNo;
	}

	public void setDirectorNo(int directorNo) {
		this.directorNo = directorNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
