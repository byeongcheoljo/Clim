package com.playus.clim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingMovieListsDAO;
import com.playus.clim.vo.ClimingMovieList;

@Service
public class ClimingMovieListsServiceImpl implements ClimingMovieListsService{
	@Autowired
	private ClimingMovieListsDAO climingMovieListsDAO;
	
	@Override
	public List<ClimingMovieList> myPageClimingList(int memberNo) {
		return climingMovieListsDAO.myPageClimingMovieList(memberNo);
	}
}
