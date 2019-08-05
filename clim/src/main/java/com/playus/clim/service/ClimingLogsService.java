package com.playus.clim.service;

import java.util.Map;

import com.playus.clim.vo.ClimingLog;

public interface ClimingLogsService {

	void joinCliming(ClimingLog log);

	Map<String, Object> getClimeeList(int roomNo);

}
