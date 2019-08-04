package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.StealCut;

@Repository
public class SteelCutsDAOImpl implements SteelCutsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public String selectOneForClimed(int movieNo) {
		return session.selectOne("steelCuts.selectOneForClimed", movieNo);
	}

}
