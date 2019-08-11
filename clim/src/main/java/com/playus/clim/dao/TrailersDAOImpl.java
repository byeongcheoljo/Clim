package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Trailer;

@Repository
public class TrailersDAOImpl implements TrailersDAO{
	
	@Autowired
	private SqlSession session;

	//재현
	@Override
	public Trailer trailerSelectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("trailers.trailerSelectOne", no);
	}
}
