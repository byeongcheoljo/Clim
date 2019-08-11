package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Clim;
import com.playus.clim.vo.ClimingList;


public interface ClimingListsService {

	void updateSessionId(ClimingList clim);
	
	public List<ClimingList> getClimingList();
	
	public Clim getClimRealtimeFeature(String src);
	
	public void make(ClimingList climingList);
	
	public ClimingList getOne(int no);

	public List<ClimingList> subscribesClimingList();
	
	public List<ClimingList> getUserClimingList(int memberNo);
	
}
