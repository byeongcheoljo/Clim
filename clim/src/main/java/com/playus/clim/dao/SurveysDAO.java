package com.playus.clim.dao;

import com.playus.clim.vo.Review;
import com.playus.clim.vo.Survey;

public interface SurveysDAO {

	public int scoreCount(Survey survey);

	public void deleteSurvey(Review review);


}
