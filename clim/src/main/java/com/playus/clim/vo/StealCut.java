package com.playus.clim.vo;

import java.sql.Timestamp;

public class StealCut {

	
	private int no, movieNo;
	private int no, movieNo,randomR;
	private String src;
	private Timestamp regdate;
	
	public StealCut() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getRandomR() {
		return randomR;
	}


	public void setRandomR(int randomR) {
		this.randomR = randomR;
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

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
