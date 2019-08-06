package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.ContinueMovie;

public interface ContinueMoviesService {


	//index에서 이어보기
	public List<ContinueMovie> getContinueList(int memberNo);
}
