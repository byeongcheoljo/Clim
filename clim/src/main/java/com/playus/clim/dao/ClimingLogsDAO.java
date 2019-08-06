package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.ClimingLog;
import com.playus.clim.vo.Member;

public interface ClimingLogsDAO {

	void insertClimingLog(ClimingLog log);

	List<Member> selectClimeeList(int roomNo);

	int climmedCnt(int roomNo);

	void updateCloseTime(ClimingLog log);

	void updateCloseTimeClim(int no);

}
