package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Movie;

public interface ClimingListsDAO {
	public List<Movie> selectList(int memberNo);
}
