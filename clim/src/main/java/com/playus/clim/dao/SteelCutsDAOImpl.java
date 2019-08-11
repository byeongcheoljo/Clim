package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.StealCut;

@Repository
public class SteelCutsDAOImpl implements SteelCutsDAO{
	
	@Autowired
	private SqlSession session;
	
	// 재현
	@Override
	public List<StealCut> steelCutSelectList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("steelCuts.steelCutSelectList", no);
	}

}
