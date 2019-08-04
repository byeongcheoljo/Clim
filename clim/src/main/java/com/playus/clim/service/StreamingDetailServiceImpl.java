package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.StreamingDetailDAO;
import com.playus.clim.vo.Movie;

@Service
public class StreamingDetailServiceImpl implements StreamingDetailService{

	@Autowired
	private StreamingDetailDAO streamingDetaildao;
	
	
	
	@Override
	public Map<String, Object> getDetailByRoomNo(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("leader", streamingDetaildao.selectLeader(no));

		map.put("movieLists",streamingDetaildao.selectMovieLists(no));
		
		return map;
	}
}
