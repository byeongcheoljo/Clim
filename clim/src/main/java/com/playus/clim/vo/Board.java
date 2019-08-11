package com.playus.clim.vo;

import java.sql.Clob;
import java.sql.Timestamp;
import java.util.List;

public class Board {
	private boolean likeCheck;
	private List<BoardTag> boardTags;
	private int no, memberNo, views , boardCount, likeCount, commentCount;
	private String contents, nickname;
	private Timestamp regdate;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public boolean isLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(boolean likeCheck) {
		this.likeCheck = likeCheck;
	}

	public List<BoardTag> getBoardTags() {
		return boardTags;
	}

	public void setBoardTags(List<BoardTag> boardTags) {
		this.boardTags = boardTags;
	}

	public Board(int no) {
		// TODO Auto-generated constructor stub
		this.no = no;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
