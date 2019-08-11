package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Review;
import com.playus.clim.vo.Survey;

@Repository
public class SurveysDAOImpl implements SurveysDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int scoreCount(Survey survey) {
		// TODO Auto-generated method stub
		int result ;
		if(session.selectOne("surveys.scoreCount", survey)==null) {
			result = 0;
		}else {
			result = session.selectOne("surveys.scoreCount", survey); 
		}
		return result;
	}
	
	@Override
	public void deleteSurvey(Review review) {
		session.delete("surveys.deleteSurvey", review);
	}
}
