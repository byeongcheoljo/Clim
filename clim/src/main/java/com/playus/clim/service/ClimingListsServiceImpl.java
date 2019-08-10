package com.playus.clim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.vo.Clim;
import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Movie;

@Service
public class ClimingListsServiceImpl implements ClimingListsService {
	@Autowired
	private ClimingListsDAO climingListsDAO;

	@Override
	public List<ClimingList> getClimingList() {
		return climingListsDAO.selectList();
	}

	@Override
	public Clim getClimRealtimeFeature(String src) {
	
		return climingListsDAO.selectFeature(src);
	}

	@Override
	public ClimingList getOne(int no) {

		return climingListsDAO.selectOne(no);
	}

	@Override
	public void make(ClimingList climingList) {
		System.out.println("z3");
		climingListsDAO.insert(climingList);
	}

	@Override
	public void updateSessionId(ClimingList clim) {
		// TODO Auto-generated method stub
		climingListsDAO.updateSessionId(clim);
	}

	@Override
	public List<ClimingList> subscribesClimingList() {
		return climingListsDAO.subscribesClimingList();
	}
}
