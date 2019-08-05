package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Movie;

@Repository
public class ClimingListsDAOImpl implements ClimingListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Movie> selectList(int memberNo) {
		return session.selectList("climingLists.selectList", memberNo);
	}

}
