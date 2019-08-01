package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Movie;

public interface MoviesDAO {
	
	public List<Movie> searchMovieListForCliming(String title);

}
