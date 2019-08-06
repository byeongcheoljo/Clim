package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.StreamingDetailDAO;
import com.playus.clim.dao.SubscribesDAO;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Subscribe;

@Service
public class StreamingDetailServiceImpl implements StreamingDetailService{

	@Autowired
	private StreamingDetailDAO streamingDetaildao;
	@Autowired
	private SubscribesDAO subscribesDAO;
	
	
	@Override
	public Map<String, Object> getDetailByRoomNo(int no, HttpSession session) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		if(session.getAttribute("loginMember")!=null) {
			Member member = (Member)session.getAttribute("loginMember");
			
			Subscribe subscribe = new Subscribe();
			
			subscribe.setFollower(no);
			subscribe.setFollowing(member.getNo());
			
			map.put("subCheck",subscribesDAO.selectOne(subscribe));
		}
		
		
		map.put("roomNo",no);
		map.put("leader", streamingDetaildao.selectLeader(no));

		map.put("movieLists",streamingDetaildao.selectMovieLists(no));
		
		
		return map;
	}
}
