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
	
	//index에서 추천4
	public List<Movie> indexRecommandationListFour();
	
	//index에서 장르1(드라마)
	public List<Movie> indexGenreListOne();
	
	//index에서 장르2(액션)
	public List<Movie> indexGenreListTwo();
	
	//index에서 장르3(모험)
	public List<Movie> indexGenreListThree();
	
	public String selectPoster(String src);
	
	
/*김근경 끝*/
	
	public Movie selectMovieTrailer(int no);
	
	public Movie selectMovie(int movieNo);
	
	public Movie movieSelectOne(int no);
}
