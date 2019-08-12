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

/*김근경 시작*/
	
	@Override
	public String selectOneForClimed(StealCut stealCut) {
		return session.selectOne("steelCuts.selectOneForClimed", stealCut);
	}
	
	//r을 위한 total
	@Override
	public int selectTotalForMovieId(int no) {
		return session.selectOne("steelCuts.selectTotalForMovieId",no);
	}
	@Override
	public List<StealCut> steelCutSelectList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("steelCuts.steelCutSelectList", no);
	}
	
/*김근경 끝*/

}
