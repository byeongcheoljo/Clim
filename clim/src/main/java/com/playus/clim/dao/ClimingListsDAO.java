package com.playus.clim.dao;

import com.playus.clim.vo.ClimingList;

public interface ClimingListsDAO {
	public int subscribesLiveCheck(int memberNo);

	public void updateSessionId(ClimingList clim);
}
