package com.playus.clim.vo;

import java.sql.Timestamp;
import java.util.List;

public class Comment {

	private int no, memberNo, boardNo, commentLikeCount, boardCommentTotal;
	private String contents, nickname;
	private Timestamp regdate;
	private List<Comment> commentList;
	private boolean likeCommentCheck;


	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public List<Comment> getCommentList() {
		return commentList;
	}



	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}



	public boolean isLikeCommentCheck() {
		return likeCommentCheck;
	}



	public void setLikeCommentCheck(boolean likeCommentCheck) {
		this.likeCommentCheck = likeCommentCheck;
	}



	public int getBoardCommentTotal() {
		return boardCommentTotal;
	}


	public void setBoardCommentTotal(int boardCommentTotal) {
		this.boardCommentTotal = boardCommentTotal;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCommentLikeCount() {
		return commentLikeCount;
	}

	public void setCommentLikeCount(int commentLikeCount) {
		this.commentLikeCount = commentLikeCount;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
