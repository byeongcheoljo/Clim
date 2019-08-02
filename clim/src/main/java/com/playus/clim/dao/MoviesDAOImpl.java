package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Movie;

@Repository
public class MoviesDAOImpl implements MoviesDAO{

	@Autowired
	private SqlSession session;

	@Override
	public List<Movie> searchMovieListForCliming(String title) {
		return session.selectList("movies.searchMovieListForCliming", "%"+title+"%");
	}
	
	@Override
	public Movie movieSelectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("movies.movieSelectOne", no);
	}
}
