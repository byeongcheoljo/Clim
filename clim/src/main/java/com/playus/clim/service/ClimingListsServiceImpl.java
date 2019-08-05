package com.playus.clim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.vo.ClimingList;

@Service
public class ClimingListsServiceImpl implements ClimingListsService{
	@Autowired
	private ClimingListsDAO climingListsDAO;
	
	@Override
	public void updateSessionId(ClimingList clim) {
		// TODO Auto-generated method stub
		climingListsDAO.updateSessionId(clim);
	}
}
