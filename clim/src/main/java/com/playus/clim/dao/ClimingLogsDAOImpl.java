package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ClimingLog;
import com.playus.clim.vo.Member;

@Repository
public class ClimingLogsDAOImpl implements ClimingLogsDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public void insertClimingLog(ClimingLog log) {
		// TODO Auto-generated method stub
		session.insert("climingLogs.insertLog",log);
	}
	@Override
	public List<Member> selectClimeeList(int roomNo) {
		// TODO Auto-generated method stub
		return session.selectList("climingLogs.selectClimees",roomNo);
	}
	@Override
	public int climmedCnt(int roomNo) {
		// TODO Auto-generated method stub
		return session.selectOne("climingLogs.selectClimeed",roomNo);
	}
	@Override
	public void updateCloseTime(ClimingLog log) {
		// TODO Auto-generated method stub
		session.update("climingLogs.setCloseTime",log);
	}
	@Override
	public void updateCloseTimeClim(int no) {
		// TODO Auto-generated method stub
		System.out.println(no);
		session.update("climingLogs.setClimCloseTime",no);
	}
}
