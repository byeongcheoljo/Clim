package com.playus.clim.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Movie;

@Service
public class ClimingListsServiceImpl implements ClimingListsService{
	@Autowired
	private ClimingListsDAO climingListsDAO;
	
	
	@Override
	public List<ClimingList> getClimingList() {
		return climingListsDAO.selectList();
	}
	
	
	@Override
	public List<Movie> getClimRealtimeFeature() {
		return climingListsDAO.selectFeature();
	}
}
