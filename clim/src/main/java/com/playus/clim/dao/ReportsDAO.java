package com.playus.clim.dao;

import com.playus.clim.vo.Report;

public interface ReportsDAO {

	//자유게시판 신고하기
	public int insertBoardReport(Report report);
}
