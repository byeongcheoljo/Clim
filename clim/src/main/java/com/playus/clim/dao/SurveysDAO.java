package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Survey;

public interface SurveysDAO {

	public List<Survey> selectSurveyList(PageVO pageVO);
	
	public int insertMovieRate(Survey survey);
	
	public int updateMovieRate(Survey survey);

}
