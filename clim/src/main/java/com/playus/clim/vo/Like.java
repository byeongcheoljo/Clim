package com.playus.clim.vo;

import java.sql.Timestamp;
import java.util.List;

public class Like {

	
	private int no, postNo, memberNo, boardNo;
	private char emotion, type;
	private Timestamp regdate;
	private List<List> boardLike;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public List<List> getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(List<List> boardLike) {
		this.boardLike = boardLike;
	}

	public Like(int memberNo, int boardNo, int postNo) {
		super();
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.postNo = postNo;
	}
	
	
	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public char getEmotion() {
		return emotion;
	}

	public void setEmotion(char emotion) {
		this.emotion = emotion;
	}

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
