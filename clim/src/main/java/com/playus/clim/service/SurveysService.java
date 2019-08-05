package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Survey;

public interface SurveysService {

	public List<Survey> selectSurveyList(int page);
	
}
