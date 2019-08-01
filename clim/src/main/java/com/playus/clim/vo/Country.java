package com.playus.clim.vo;

import java.sql.Timestamp;

public class Country {

	private int no;
	private String nameEng, nameKor;
	private Timestamp regdate;
	
	
	public Country() {
		// TODO Auto-generated constructor stub
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getNameEng() {
		return nameEng;
	}


	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}


	public String getNameKor() {
		return nameKor;
	}


	public void setNameKor(String nameKor) {
		this.nameKor = nameKor;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
}
