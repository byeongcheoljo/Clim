package com.playus.clim.dao;

import java.util.List; 

import com.playus.clim.vo.ContinueMovie;

public interface ContinueMoviesDAO {

	//index에서 이어보기
	public List<ContinueMovie> indexContinueList(int memberNo);
}
