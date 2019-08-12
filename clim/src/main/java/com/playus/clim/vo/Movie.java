package com.playus.clim.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Movie {

	private int no, runtime, audiAcc, cookieTime, endingCreditTime, climed, cnt;
	private String title, contents, src, titleEng, poster, repGenre, recSteal, movieRating;
	private Date opendate;

	private Timestamp regdate;
	private double score;
	private boolean checkBookmark, checkSpoilerReport;
	private boolean bookmarkCheck;

	public Movie() {
		// TODO Auto-generated constructor stub
	}

	public boolean isBookmarkCheck() {
		return bookmarkCheck;
	}

	public void setBookmarkCheck(boolean bookmarkCheck) {
		this.bookmarkCheck = bookmarkCheck;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getRecSteal() {
		return recSteal;
	}

	public void setRecSteal(String recSteal) {
		this.recSteal = recSteal;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public int getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(int audiAcc) {
		this.audiAcc = audiAcc;
	}

	public int getCookieTime() {
		return cookieTime;
	}

	public void setCookieTime(int cookieTime) {
		this.cookieTime = cookieTime;
	}

	public int getEndingCreditTime() {
		return endingCreditTime;
	}

	public void setEndingCreditTime(int endingCreditTime) {
		this.endingCreditTime = endingCreditTime;
	}

	public int getClimed() {
		return climed;
	}

	public void setClimed(int climed) {
		this.climed = climed;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getTitleEng() {
		return titleEng;
	}

	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getRepGenre() {
		return repGenre;
	}

	public void setRepGenre(String repGenre) {
		this.repGenre = repGenre;
	}

	public Date getOpendate() {
		return opendate;
	}

	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}

	
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getMovieRating() {
		return movieRating;
	}

	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}

	public boolean isCheckBookmark() {
		return checkBookmark;
	}

	public void setCheckBookmark(boolean checkBookmark) {
		this.checkBookmark = checkBookmark;
	}

	public boolean isCheckSpoilerReport() {
		return checkSpoilerReport;
	}

	public void setCheckSpoilerReport(boolean checkSpoilerReport) {
		this.checkSpoilerReport = checkSpoilerReport;
	}
	
	

}
