package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Actor;

@Repository
public class ActorsDAOImpl implements ActorsDAO{
	
	@Autowired
	private SqlSession session;
	
	// 재현
	@Override
	public List<Actor> actorSelectList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("actors.actorsSelectList", no);
	}
	// 재현

}
