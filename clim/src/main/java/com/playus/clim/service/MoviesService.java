package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import com.playus.clim.vo.Movie;

public interface MoviesService {
	
	public List<Movie> getSearchResultForcliming(String title);
	
	//index에서 끌림작
	public List<Movie> getClimedList();
	//index에서 추천작
	public Map<String, Object> getRecommandationList();
}
