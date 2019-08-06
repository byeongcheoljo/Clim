package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.SurveysDAO;
import com.playus.clim.util.PaginateUtil;
import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Survey;

@Service
public class SurveysServiceImpl implements SurveysService{

	@Autowired
	private SurveysDAO surveysDAO;
	
	@Autowired
	private PaginateUtil paginateUtil;
	
	@Override
	public List<Survey> selectSurveyList(int page) {
		// TODO Auto-generated method stub
		//Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 5 ;
		//int total = 100;
		
		PageVO pageVO = new PageVO(page, numPage);
		//map.put("movieList", );
		//map.put("paginate",paginateUtil.getPaginate(page, total, numPage, 3, "survey"));
		
		
		return surveysDAO.selectSurveyList(pageVO);
	}
	
	@Override
	public int insertMovieRate(Survey survey) {
		// TODO Auto-generated method stub
		return surveysDAO.insertMovieRate(survey);
	}
	
	@Override
	public int updateMovieRate(Survey survey) {
		// TODO Auto-generated method stub
		return surveysDAO.updateMovieRate(survey);
	}
	
}
