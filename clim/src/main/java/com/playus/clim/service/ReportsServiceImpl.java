package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ReportsDAO;
import com.playus.clim.vo.Report;

@Service
public class ReportsServiceImpl implements ReportsService{
	@Autowired
	private ReportsDAO reportsdao;
	
	
	
	@Override
	public void reportClimer(int roomNo, int userNo,String content) {
		// TODO Auto-generated method stub
		Report report= new Report();
		report.setPostNo(roomNo);
		report.setReporterNo(userNo);
		report.setContents(content);
		reportsdao.insertReportClimer(report);
		
	}
	
	
	@Override
	public int reportFaq(Report report) {
		// TODO Auto-generated method stub
		return reportsdao.insertFAQ(report);

	}
	
	@Override
	public int boardReportInsert(Report report) {
		// TODO Auto-generated method stub
		return reportsdao.insertBoardReport(report);

	}
	@Override
	public int reportSpoiler(Report report) {
		// TODO Auto-generated method stub
		return reportsdao.reportSpoiler(report);
	}
}
