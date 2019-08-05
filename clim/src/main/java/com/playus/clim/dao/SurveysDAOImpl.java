package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.PageVO;
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
}
