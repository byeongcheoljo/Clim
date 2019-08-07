package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;

@Repository
public class ClimingListsDAOImpl implements ClimingListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ClimingList> selectList() {
		
		 List<ClimingList> climingList = session.selectList("climingLists.selectList");
		 //System.out.println("리스트! : "+climingList);
		 
		 return  climingList;
	}
	
	@Override
	public List<Movie> selectFeature() {
		
		return session.selectList("climingLists.selectFeatures");
	}
}
