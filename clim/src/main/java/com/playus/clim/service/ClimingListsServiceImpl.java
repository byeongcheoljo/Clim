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
	public ClimingList getOne(int no) {
		
		return climingListsDAO.selectOne(no); 
	}
	
	@Override
	public void make(ClimingList climingList) {
		System.out.println("z3");
		climingListsDAO.insert(climingList);
	}
	@Override
	public List<ClimingList> subscribesClimingList() {
		return climingListsDAO.subscribesClimingList();
	}
}
