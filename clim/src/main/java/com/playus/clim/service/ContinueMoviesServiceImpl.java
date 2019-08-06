package com.playus.clim.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ContinueMoviesDAO;
import com.playus.clim.vo.ContinueMovie;

@Service
public class ContinueMoviesServiceImpl implements ContinueMoviesService{

	@Autowired
	private ContinueMoviesDAO continueMoviesDAO;
	
	
	
/*김근경 시작 */
	//index에서 이어보기
	@Override
	public List<ContinueMovie> getContinueList(int memberNo) {
		
		 
		return continueMoviesDAO.indexContinueList(memberNo);
	}
/*김근경 끝*/
}
