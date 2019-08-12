package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Review;
import com.playus.clim.vo.Survey;

@Repository
public class SurveysDAOImpl implements SurveysDAO{
	
	@Autowired
	private SqlSession session;

	
	@Override
	public List<Survey> selectSurveyList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("surveys.selectSurveyList",pageVO);
	}
	
	@Override
	public int insertMovieRate(Survey survey) {
		// TODO Auto-generated method stub
		return session.insert("surveys.insertSurvey", survey);
	}
	
	@Override
	public int updateMovieRate(Survey survey) {
		// TODO Auto-generated method stub
		return session.update("surveys.updateSurvey",survey);
	}
	
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
