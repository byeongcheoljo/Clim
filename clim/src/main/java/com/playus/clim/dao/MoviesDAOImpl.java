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

/*김근경 시작*/
	
	//index에서 끌림작 1위~30위
	@Override
	public List<Movie> indexClimedList() {
		return session.selectList("movies.indexClimedList");
	}

	//index에서 추천1
	@Override
	public List<Movie> indexRecommandationListOne() {
		return session.selectList("movies.indexRecommandationListOne");
	}
	
	//index에서 추천2
	@Override
	public List<Movie> indexRecommandationListTwo() {
		return session.selectList("movies.indexRecommandationListTwo");
	}
	
	//index에서 추천3
	@Override
	public List<Movie> indexRecommandationListThree() {
		return session.selectList("movies.indexRecommandationListThree");
	}
	
/*김근경 끝*/
	
	@Override
	public Movie selectMovieTrailer(int no) {
		return session.selectOne("movies.selectMovieTrailer",no);
	}
}
