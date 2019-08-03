package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.ClimingMovieList;

public interface ClimingMovieListsDAO {
	public List<ClimingMovieList> myPageClimingMovieList(int memberNo);
}
