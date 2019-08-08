package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingLogsDAO;
import com.playus.clim.vo.ClimingLog;
import com.playus.clim.vo.Member;

@Service
public class ClimingLogsServiceImpl implements ClimingLogsService{	
	@Autowired
	private ClimingLogsDAO climingLogsDAO;
	
	@Override
	public void joinCliming(ClimingLog log) {
		// TODO Auto-generated method stub
		climingLogsDAO.insertClimingLog(log);
	}
	
	@Override
	public Map<String, Object> getClimeeList(int roomNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		List<Member> climee = climingLogsDAO.selectClimeeList(roomNo);
		
		map.put("climees",climee);
		map.put("climeesCnt",climee.size());
		map.put("climeedCnt",climingLogsDAO.climmedCnt(roomNo));
		return map;
	}
	@Override
	public void getOutCliming(int no,String sessionId) {
		// TODO Auto-generated method stub
		ClimingLog log = new ClimingLog();
		log.setNo(no);
		log.setSessionId(sessionId);
		climingLogsDAO.updateCloseTime(log);
	}
	@Override
	public void climClose(int no) {
		// TODO Auto-generated method stub
		climingLogsDAO.updateCloseTimeClim(no);
	}
}
