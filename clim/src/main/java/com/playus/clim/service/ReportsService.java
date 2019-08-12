package com.playus.clim.service;

import com.playus.clim.vo.Report;

public interface ReportsService {

	void reportClimer(int roomNo, int userNo,String content);

	public int reportFaq(Report report);

	public int reportSpoiler(Report report);

	public int boardReportInsert(Report report);

}
