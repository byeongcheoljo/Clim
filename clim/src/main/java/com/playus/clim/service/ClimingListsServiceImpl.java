package com.playus.clim.service;

<<<<<<< HEAD

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
=======
import org.springframework.beans.factory.annotation.Autowired;

>>>>>>> master
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.vo.ClimingList;
<<<<<<< HEAD
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
=======

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
	

>>>>>>> master
}
