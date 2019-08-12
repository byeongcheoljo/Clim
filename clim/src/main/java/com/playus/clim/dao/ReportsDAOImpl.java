package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Report;

@Repository
public class ReportsDAOImpl implements ReportsDAO {

	@Autowired
	private SqlSession session;

	@Override
	public void insertReportClimer(Report report) {
		// TODO Auto-generated method stub
		System.out.println(report.getPostNo());
		System.out.println(report.getReporterNo());
		System.out.println(report.getContents());
		session.insert("reports.climer", report);
	}

	@Override
	public int insertFAQ(Report report) {
		// TODO Auto-generated method stub
		return session.insert("reports.faq", report);
	}

	@Override
	public int reportSpoiler(Report report) {
		// TODO Auto-generated method stub
		return session.insert("reports.reportSpoiler", report);
	}
	
	@Override
	public int checkSpoiler(Report report) {
		// TODO Auto-generated method stub
		return session.selectOne("reports.checkSpoiler", report);
		
	}


		session.insert("reports.climer", report);
	}


	@Override
	public int insertBoardReport(Report report) {
		// TODO Auto-generated method stub
		return session.insert("reports.insertBoardReport", report);
	}
	
}
