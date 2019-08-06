package com.playus.clim.service;

import com.playus.clim.vo.ClimingList;

public interface ClimingListsService {

	public void make(ClimingList climingList);
	
	public ClimingList getOne(int no);

}
