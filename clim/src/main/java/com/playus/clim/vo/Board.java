package com.playus.clim.vo;

import java.sql.Clob;
import java.sql.Timestamp;

public class Board {

	private int no, memberNo, views, likeCount, commentCount, boardCount;
	private String contents, nickname;
	private Timestamp regdate;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int no) {
		// TODO Auto-generated constructor stub
		this.no=no;
	}
	
	public String getNickname() {
		return nickname;
	}


	public int getBoardCount() {
		return boardCount;
	}


	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getLikeCount() {
		return likeCount;
	}



	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}



	public int getCommentCount() {
		return commentCount;
	}



	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}



	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
