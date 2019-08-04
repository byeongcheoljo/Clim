package com.playus.clim.service;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> master
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ClimingMovieListsDAO;
<<<<<<< HEAD
import com.playus.clim.vo.ClimingMovieList;

@Service
public class ClimingMovieListsServiceImpl implements ClimingMovieListsService{
	@Autowired
	private ClimingMovieListsDAO climingMovieListsDAO;
	
	@Override
	public List<ClimingMovieList> myPageClimingList(int memberNo) {
		return climingMovieListsDAO.myPageClimingMovieList(memberNo);
	}
=======

@Service
public class ClimingMovieListsServiceImpl implements ClimingMovieListsService{
	
>>>>>>> master
}
