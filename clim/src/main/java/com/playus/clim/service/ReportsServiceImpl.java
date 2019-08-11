package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ReportsDAO;
import com.playus.clim.vo.Report;

@Service
public class ReportsServiceImpl implements ReportsService{

	@Autowired
	private ReportsDAO reportsDAO;
	
	@Override
	public int boardReportInsert(Report report) {
		// TODO Auto-generated method stub
		return reportsDAO.insertBoardReport(report);
	}
}
