package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ActorsDAO;
import com.playus.clim.dao.DirectorsDAO;
import com.playus.clim.dao.GenresDAO;
import com.playus.clim.dao.MoviesDAO;
import com.playus.clim.vo.Actor;
import com.playus.clim.vo.Director;
import com.playus.clim.vo.Genre;
import com.playus.clim.vo.Movie;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Autowired
	private MoviesDAO moviesDAO;
	@Autowired
	private DirectorsDAO directorsDAO;
	@Autowired
	private ActorsDAO actorsDAO;
	@Autowired
	private GenresDAO genresDAO;

	@Override
	public List<Movie> getSearchResultForcliming(String title) {
		return moviesDAO.searchMovieListForCliming(title);
	}
	
	@Override
	public Map<String, Object> getMovieDetail(int no) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Movie movie = moviesDAO.movieSelectOne(no);
		List<Director> directors = directorsDAO.directorSelectList(no);
		List<Actor> actors = actorsDAO.actorSelectList(no);
		List<Genre> genres = genresDAO.genreSelectList(no);
		
		
		map.put("movie", movie);
		map.put("directors", directors);
		map.put("actors", actors);
		map.put("genres", genres);
		
		return map;
	}

}
