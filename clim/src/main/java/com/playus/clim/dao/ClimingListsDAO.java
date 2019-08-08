package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Movie;


public interface ClimingListsDAO {
	// ajax에서 필요한 끌리밍리스트
	public List<ClimingList> selectList();

	// websocket으로 가져올 끌리밍 포스터/스틸컷/장르
	public List<Movie> selectFeature();

	public ClimingList selectOne(int no);

	public void insert(ClimingList climingList);

	public int subscribesLiveCheck(int memberNo);

	public void updateSessionId(ClimingList clim);
	
	public List<ClimingList> subscribesClimingList();
}
