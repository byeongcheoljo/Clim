package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Movie;

public interface MoviesDAO {
	
	public List<Movie> searchMovieListForCliming(String title);

	
/*김근경 시작*/
	
	
	//index에서 끌림작 1위~30위
	public List<Movie> indexClimedList();
	
	//index에서 추천1
	public List<Movie> indexRecommandationListOne();
	
	//index에서 추천2
	public List<Movie> indexRecommandationListTwo();
	
	//index에서 추천3
	public List<Movie> indexRecommandationListThree(); 
	
	
/*김근경 끝*/
	
	
}
