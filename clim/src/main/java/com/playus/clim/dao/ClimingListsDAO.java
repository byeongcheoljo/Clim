package com.playus.clim.dao;

import com.playus.clim.vo.ClimingList;

public interface ClimingListsDAO {

	public ClimingList selectOne(int no);

	public void insert(ClimingList climingList);

	public int subscribesLiveCheck(int memberNo);
}
