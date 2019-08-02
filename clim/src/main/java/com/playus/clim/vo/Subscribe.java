package com.playus.clim.vo;

import java.sql.Timestamp;

public class Subscribe {

	private int no, following, follower;
	private Timestamp regdate;
	private boolean LiveCheck;

	public Subscribe() {
		// TODO Auto-generated constructor stub
	}

	public boolean isLiveCheck() {
		return LiveCheck;
	}

	public void setLiveCheck(boolean liveCheck) {
		LiveCheck = liveCheck;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFollowing() {
		return following;
	}

	public void setFollowing(int following) {
		this.following = following;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
