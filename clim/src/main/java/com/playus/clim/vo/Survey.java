package com.playus.clim.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Survey {
	
	private int no, movieNo, memberNo, score, rowNum;
	private String title, poster, nameKor;
	private Timestamp regdate;
	private Date opendate;
	
	public Survey() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getRowNum() {
		return rowNum;
	}



	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}



	public String getNameKor() {
		return nameKor;
	}



	public void setNameKor(String nameKor) {
		this.nameKor = nameKor;
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



	public Date getOpendate() {
		return opendate;
	}



	public void setOpendate(Date opendate) {
		this.opendate = opendate;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
