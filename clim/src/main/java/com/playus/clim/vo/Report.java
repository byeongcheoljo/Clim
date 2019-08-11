package com.playus.clim.vo;

import java.sql.Timestamp;

public class Report {

	private int no, reporterNo, reportedNo, postNo;
	private char type;
	private String contents, title;
	private Timestamp regdate;
	
	
	public Report() {
		// TODO Auto-generated constructor stub
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getReporterNo() {
		return reporterNo;
	}


	public void setReporterNo(int reporterNo) {
		this.reporterNo = reporterNo;
	}


	public int getReportedNo() {
		return reportedNo;
	}


	public void setReportedNo(int reportedNo) {
		this.reportedNo = reportedNo;
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public char getType() {
		return type;
	}


	public void setType(char type) {
		this.type = type;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
