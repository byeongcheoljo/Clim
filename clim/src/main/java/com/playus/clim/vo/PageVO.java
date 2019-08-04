package com.playus.clim.vo;

public class PageVO {
	/* 0803 홍성표 memberNo 추가 */
	private int start, end, no, memberNo;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	public PageVO(int page, int numPage) {
		//page : 페이지번호
		//numPage : 한페이지당 보여지는 게시물수
		this.end = page * numPage;
		this.start = end-numPage+1;
	}

	public PageVO(int page, int numPage, int memberNo) {
		this.end = page * numPage;
		this.start = end-numPage+1;
		this.memberNo = memberNo;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}
