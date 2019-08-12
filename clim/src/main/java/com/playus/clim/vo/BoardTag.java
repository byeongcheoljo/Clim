package com.playus.clim.vo;

import java.sql.Timestamp;

public class BoardTag {

	private int no, boardNo, tagNo;
	private String tagName;
	private String[] tag;
	private Timestamp regdate;
	
	public BoardTag() {
		// TODO Auto-generated constructor stub
	}

	
	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}


	public String[] getTag() {
		return tag;
	}


	public void setTag(String[] tag) {
		this.tag = tag;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
