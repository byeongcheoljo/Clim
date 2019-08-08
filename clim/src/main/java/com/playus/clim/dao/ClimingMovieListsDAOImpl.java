package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ClimingMovieList;

@Repository
public class ClimingMovieListsDAOImpl implements ClimingMovieListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ClimingMovieList> myPageClimingMovieList(int memberNo) {
		return session.selectList("climingMoviesLists.myPageClimingMovieList",memberNo);
	}
	@Override
	public void insertPlyaedMovie(ClimingMovieList climingMovieList) {
		// TODO Auto-generated method stub
		
		session.insert("climingMoviesLists.insertPlayedMovie",climingMovieList);

	}
}
