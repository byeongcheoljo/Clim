package com.playus.clim.service;

<<<<<<< HEAD
import java.util.List;
import java.util.Map;

import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Movie;

public interface ClimingListsService {
	
	public List<ClimingList> getClimingList();
	
	public List<Movie> getClimRealtimeFeature();
=======
import com.playus.clim.vo.ClimingList;

public interface ClimingListsService {

	public void make(ClimingList climingList);
	
	public ClimingList getOne(int no);

>>>>>>> master
}
