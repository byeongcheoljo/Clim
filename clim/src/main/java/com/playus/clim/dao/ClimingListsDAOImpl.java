package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ClimingList;

@Repository
public class ClimingListsDAOImpl implements ClimingListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ClimingList climingList) {
		System.out.println("z2");
		session.insert("climingLists.insert", climingList);
	}
	
	@Override
	public ClimingList selectOne(int no) {
		return session.selectOne("climingLists.selectOne", no);
	}

}
