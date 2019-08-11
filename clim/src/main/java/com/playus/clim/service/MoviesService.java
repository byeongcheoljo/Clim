package com.playus.clim.service;

import java.util.List;
import java.util.Map;


import com.playus.clim.vo.Movie;

public interface MoviesService {
	
	public List<Movie> getSearchResultForcliming(String title);
	// 재현
	public Map<String, Object> getMovieDetail(int no, int loginMemberNo);

}
