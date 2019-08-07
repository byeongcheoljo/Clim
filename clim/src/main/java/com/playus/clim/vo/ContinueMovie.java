package com.playus.clim.vo;

import java.sql.Timestamp;

public class ContinueMovie {

	private int no, memberNo, movieNo, currentTime, runtime;
	private char flag;
	private String title, poster;
	private Timestamp regdate;

	public ContinueMovie() {
		// TODO Auto-generated constructor stub
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime*60;
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

	public int getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(int currentTime) {
		this.currentTime = currentTime;
	}

	public char getFlag() {
		return flag;
	}

	public void setFlag(char flag) {
		this.flag = flag;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
