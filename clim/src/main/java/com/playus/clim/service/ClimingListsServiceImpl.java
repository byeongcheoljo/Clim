package com.playus.clim.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
=======

>>>>>>> master
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingListsDAO;
import com.playus.clim.vo.ClimingList;

@Service
public class ClimingListsServiceImpl implements ClimingListsService{
	
<<<<<<< HEAD
	@Autowired
	private ClimingListsDAO climingListsDAO;
	
	@Override
	public ClimingList getOne(int no) {
		
		return climingListsDAO.selectOne(no); 
	}
	
	@Override
	public void make(ClimingList climingList) {
		climingListsDAO.insert(climingList);
	}
	

=======
>>>>>>> master
}
