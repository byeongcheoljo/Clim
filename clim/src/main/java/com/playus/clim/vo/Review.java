package com.playus.clim.vo;

import java.sql.Timestamp;

/**
 * @author Administrator
 *
 */
public class Review {

	private int no, movieNo, memberNo, score;
	private String contents, nickname;
	private Timestamp regdate;
	private boolean checkSpoiler, checkLike, checkDisLike;
	private int like, dislike;
	
	public Review() {
		// TODO Auto-generated constructor stub
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


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public boolean isCheckSpoiler() {
		return checkSpoiler;
	}


	public void setCheckSpoiler(boolean checkSpoiler) {
		this.checkSpoiler = checkSpoiler;
	}


	public boolean isCheckLike() {
		return checkLike;
	}


	public void setCheckLike(boolean checkLike) {
		this.checkLike = checkLike;
	}


	public boolean isCheckDisLike() {
		return checkDisLike;
	}


	public void setCheckDisLike(boolean checkDisLike) {
		this.checkDisLike = checkDisLike;
	}


	public int getLike() {
		return like;
	}


	public void setLike(int like) {
		this.like = like;
	}


	public int getDislike() {
		return dislike;
	}


	public void setDislike(int dislike) {
		this.dislike = dislike;
	}


	
	
}
