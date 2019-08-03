package com.playus.clim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ActorsDAO;
import com.playus.clim.dao.DirectorsDAO;
import com.playus.clim.dao.MoviesDAO;
import com.playus.clim.vo.Movie;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Autowired
	private MoviesDAO moviesDAO;
	@Autowired
	private ActorsDAO actorsDAO;
	@Autowired
	private DirectorsDAO directorsDAO;

	@Override
	public List<Movie> getSearchResultForcliming(String title) {
		return moviesDAO.searchMovieListForCliming(title);
	}
	
	@Override
	public Map<String, Object> getMovieTrailer(int no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie",moviesDAO.selectMovieTrailer(no));
		map.put("directors",directorsDAO.selectDirectorForMovie(no));
		map.put("actors",actorsDAO.selectListForMovie(no));
		return map;
	}

}
