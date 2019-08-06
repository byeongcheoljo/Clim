package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ContinueMovie;

@Repository
public class ContinueMoviesDAOImpl implements ContinueMoviesDAO{
	
	@Autowired
	private SqlSession session;
	
/*김근경 시작 */
	//index에서 이어보기
	@Override
	public List<ContinueMovie> indexContinueList(int memberNo) {
		return session.selectList("continueMovies.indexContinueList",memberNo);
	}
/*김근경 끝*/
	
}
