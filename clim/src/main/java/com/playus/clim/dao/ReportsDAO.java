package com.playus.clim.dao;

import com.playus.clim.vo.Report;

public interface ReportsDAO {


	void insertReportClimer(Report report);
	
	public int insertFAQ(Report report);

	public int reportSpoiler(Report report);

	public int checkSpoiler(Report report);

	//자유게시판 신고하기
	public int insertBoardReport(Report report);
	
}
