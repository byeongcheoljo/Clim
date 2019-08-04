package com.playus.clim.service;

import java.io.ObjectOutputStream.PutField;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.MoviesDAO;
import com.playus.clim.dao.SteelCutsDAO;
import com.playus.clim.vo.Movie;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Autowired
	private MoviesDAO moviesDAO;
	@Autowired
	private SteelCutsDAO steelcutsDAO;

	@Override
	public List<Movie> getSearchResultForcliming(String title) {
		return moviesDAO.searchMovieListForCliming(title);
	}
	
	//index에서 끌림작 1위~6위
	@Override
	public List<Movie> getClimedList() {
		
		List<Movie> movies = moviesDAO.indexClimedListOne();
		
		for(Movie movie: movies) {
			movie.setRecSteal(steelcutsDAO.selectOneForClimed(movie.getNo()));
			System.out.println(movie.getRecSteal());
		}
		
		
		
		return movies;
	}
	//index에서 추천작1~3
	@Override
	public Map<String, Object> getRecommandationList() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("recOne",moviesDAO.indexRecommandationListOne());//추천작1
		map.put("recTwo",moviesDAO.indexRecommandationListTwo());//추천작2
		map.put("recThree",moviesDAO.indexRecommandationListThree());//추천작3
		
		return map;
	}

}
