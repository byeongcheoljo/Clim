package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Movie;

public interface ClimingListsService {
	
	public List<ClimingList> getClimingList();
	
	public List<Movie> getClimRealtimeFeature();
	
	public void make(ClimingList climingList);
	
	public ClimingList getOne(int no);



	
}
