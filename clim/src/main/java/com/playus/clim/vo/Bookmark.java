package com.playus.clim.vo;

import java.sql.Timestamp;

public class Bookmark {

<<<<<<< HEAD
	private int no, memberNo, movieNo;
	private String title, poster;
=======
	/*0802 runtime title poster추가 홍성표*/
	private int no, memberNo, movieNo, runtime;
>>>>>>> master
	private Timestamp regdate;
	private String title, poster;
	private char type;
	
	
	public Bookmark() {
		// TODO Auto-generated constructor stub
	}


<<<<<<< HEAD
=======
	
	public int getRuntime() {
		return runtime;
	}



	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}



>>>>>>> master
	public String getTitle() {
		return title;
	}


<<<<<<< HEAD
=======

>>>>>>> master
	public void setTitle(String title) {
		this.title = title;
	}


<<<<<<< HEAD
=======

>>>>>>> master
	public String getPoster() {
		return poster;
	}


<<<<<<< HEAD
=======

>>>>>>> master
	public void setPoster(String poster) {
		this.poster = poster;
	}


<<<<<<< HEAD
=======

>>>>>>> master
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
