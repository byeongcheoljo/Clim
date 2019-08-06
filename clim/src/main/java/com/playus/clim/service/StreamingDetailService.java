package com.playus.clim.service;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface StreamingDetailService {

	public Map<String, Object> getDetailByRoomNo(int no, HttpSession session);

}
