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
			subscribe.setLiveCheck(1 == climingListsDAO.subscribesLiveCheck(memberNo));
		}

		return subscribes;
	}
}
