package com.playus.clim.vo;

import java.sql.Date; 
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Event {

	private int no, memberNo;
	private String title, contents;
	private Date startDate, endDate;
	private boolean fullDay;
	private Timestamp regdate;
	
	public Event() {
		// TODO Auto-generated constructor stub
	}

	public boolean isFullDay() {
		return fullDay;
	}

	public void setFullDay(boolean fullDay) {
		this.fullDay = fullDay;
	}

	@JsonProperty("start")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@JsonProperty("end")
	public Date getEndDate() {
		 SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd 09:00:00");
		String date= sdf.format(endDate);
		endDate = Date.valueOf(date);
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@JsonProperty("id")
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	@JsonProperty("contentText")
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
