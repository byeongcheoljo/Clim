package com.playus.clim.service;

import java.util.List;
import java.util.Map;

import com.playus.clim.vo.Movie;

public interface MoviesService {
	
	public List<Movie> getSearchResultForcliming(String title);
<<<<<<< HEAD

/*김근경 시작*/
	//index에서 끌림작
	public List<Movie> getClimedList();
	
	//index에서 추천작
	public Map<String, Object> getRecommandationList();
/*김근경 끝*/
=======
	public Map<String, Object> getMovieTrailer(int no);
>>>>>>> master
}
