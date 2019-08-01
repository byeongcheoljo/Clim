package com.playus.clim.vo;

import java.sql.Timestamp;

public class MovieCountry {

	
	private int no, movieNo, countryNo;
	private Timestamp regdate;
	
	
	public MovieCountry() {
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


	public int getCountryNo() {
		return countryNo;
	}


	public void setCountryNo(int countryNo) {
		this.countryNo = countryNo;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
