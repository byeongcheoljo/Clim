package com.playus.clim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.dao.SubscribesDAO;
import com.playus.clim.vo.Subscribe;

@Service
public class SubscribesServiceImpl implements SubscribesService {

	@Autowired
	private SubscribesDAO subscribesDAO;

	@Autowired
	private ClimingListsDAO climingListsDAO;

	@Override
	public List<Subscribe> getList(int memberNo) {
		List<Subscribe> subscribes = subscribesDAO.selectList(memberNo);
		for (Subscribe subscribe : subscribes) {
			subscribe.setLiveCheck(1==climingListsDAO.subscribesLiveCheck(subscribe.getFollower()));;
		}
		return subscribes;
	}
	
	@Override
	public int subscribes(int memberNo, int userNo) {
		Subscribe subscribe = new Subscribe();
		subscribe.setFollowing(memberNo);
		subscribe.setFollower(userNo);
		System.out.println(memberNo);
		System.out.println(userNo);
		int count = subscribesDAO.subscribesCheck(subscribe);
		
		if(count==1) {
			int result = subscribesDAO.delete(subscribe);
			System.out.println("delete:"+result);
		}else {
			int result = subscribesDAO.insert(subscribe);
			System.out.println("insert: "+result);
		}
		
		return count;
	}
}
