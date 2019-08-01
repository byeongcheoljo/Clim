package com.playus.clim.vo;

import java.sql.Timestamp;

public class Payment {

	
	private int no, memberNo, cardName;
	private char grade;
	private String cardNo, cardVaildate, cardPW, cardCVC;
	private Timestamp regdate;
	
	
	public Payment() {
		// TODO Auto-generated constructor stub
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


	public int getCardName() {
		return cardName;
	}


	public void setCardName(int cardName) {
		this.cardName = cardName;
	}


	public char getGrade() {
		return grade;
	}


	public void setGrade(char grade) {
		this.grade = grade;
	}


	public String getCardNo() {
		return cardNo;
	}


	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}


	public String getCardVaildate() {
		return cardVaildate;
	}


	public void setCardVaildate(String cardVaildate) {
		this.cardVaildate = cardVaildate;
	}


	public String getCardPW() {
		return cardPW;
	}


	public void setCardPW(String cardPW) {
		this.cardPW = cardPW;
	}


	public String getCardCVC() {
		return cardCVC;
	}


	public void setCardCVC(String cardCVC) {
		this.cardCVC = cardCVC;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
