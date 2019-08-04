package com.playus.clim.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.UUID;

public class Member {

	private int no, followerCnt, climgCnt;
	private String email, nickname, pwd, uuid;
	private char gender;
	private Date birthDate;
	private Timestamp regdate;
	private boolean subscribeCheck;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public boolean isSubscribeCheck() {
		return subscribeCheck;
	}

	public void setSubscribeCheck(boolean subscribeCheck) {
		this.subscribeCheck = subscribeCheck;
	}

	public int getFollowerCnt() {
		return followerCnt;
	}

	public void setFollowerCnt(int followerCnt) {
		this.followerCnt = followerCnt;
	}

	public int getClimgCnt() {
		return climgCnt;
	}

	public void setClimgCnt(int climgCnt) {
		this.climgCnt = climgCnt;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
