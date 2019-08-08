package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.ClimingList;

public interface ClimingListsDAO {

	public ClimingList selectOne(int no);

	public void insert(ClimingList climingList);

	public int subscribesLiveCheck(int memberNo);
	
	public List<ClimingList> subscribesClimingList();
}
