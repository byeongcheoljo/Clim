package com.playus.clim.dao;

import com.playus.clim.vo.Report;

public interface ReportsDAO {


	void insertReportClimer(Report report);
	
	public int insertFAQ(Report report);

	int insertBoardReport(Report report);

	public int reportSpoiler(Report report);

	public int checkSpoiler(Report report);
}
