package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingMovieListsDAO;
import com.playus.clim.vo.ClimingMovieList;

@Service
public class ClimingMovieListsServiceImpl implements ClimingMovieListsService{
	@Autowired
	private ClimingMovieListsDAO climingMovieListsDAO;
	@Override
	public void insertPlayedMovie(int roomNo, int movieNo) {
		// TODO Auto-generated method stub
		ClimingMovieList climingMovieList = new ClimingMovieList();
		climingMovieList.setClimingNo(roomNo);
		climingMovieList.setMovieNo(movieNo);
		
		climingMovieListsDAO.insertPlyaedMovie(climingMovieList);
	}
}
