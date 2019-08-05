package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Movie;

public interface ClimingListsService {

	public List<Movie> getList(int memberNo);
}
