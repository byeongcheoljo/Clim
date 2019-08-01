package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentsDAOImpl implements PaymentsDAO{
	
	@Autowired
	private SqlSession session;

}
