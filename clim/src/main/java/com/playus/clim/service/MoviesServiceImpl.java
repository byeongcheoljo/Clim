package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.ActorsDAO;
import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.dao.DirectorsDAO;
import com.playus.clim.dao.GenresDAO;
import com.playus.clim.dao.MoviesDAO;
import com.playus.clim.dao.ReviewsDAO;
import com.playus.clim.dao.SteelCutsDAO;
import com.playus.clim.dao.SurveysDAO;
import com.playus.clim.dao.TrailersDAO;
import com.playus.clim.vo.Actor;
import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Director;
import com.playus.clim.vo.Genre;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Review;
import com.playus.clim.vo.StealCut;
import com.playus.clim.vo.Survey;
import com.playus.clim.vo.Trailer;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Autowired
	private MoviesDAO moviesDAO;
	@Autowired
	private DirectorsDAO directorsDAO;
	@Autowired
	private ActorsDAO actorsDAO;
	@Autowired
	private GenresDAO genresDAO;
	@Autowired
	private TrailersDAO trailersDAO;
	@Autowired
	private SteelCutsDAO steelCutsDAO;
	@Autowired
	private BookmarksDAO bookmarksDAO;
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private SurveysDAO surveysDAO;
	
	@Override
	public List<Movie> getSearchResultForcliming(String title) {
		return moviesDAO.searchMovieListForCliming(title);
	}
	
	@Override
	public Map<String, Object> getMovieDetail(int no, int loginMemberNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Movie movie = moviesDAO.movieSelectOne(no);
		List<Director> directors = directorsDAO.directorSelectList(no);
		List<Actor> actors = actorsDAO.actorSelectList(no);
		List<Genre> genres = genresDAO.genreSelectList(no);
		Trailer trailer = trailersDAO.trailerSelectOne(no);
		List<StealCut> steelCuts = steelCutsDAO.steelCutSelectList(no);
		
		Survey survey = new Survey();
		survey.setMovieNo(no);
		survey.setMemberNo(loginMemberNo);
		
		int scoreCount = surveysDAO.scoreCount(survey);
		
		Bookmark bookmark = new Bookmark();
		bookmark.setMovieNo(no);
		bookmark.setMemberNo(loginMemberNo);
		bookmark.setType('B');
		
		Bookmark climBookmark = new Bookmark();
		climBookmark.setMovieNo(no);
		climBookmark.setMemberNo(loginMemberNo);
		climBookmark.setType('S');
		
		map.put("movie", movie);
		map.put("directors", directors);
		map.put("actors", actors);
		map.put("genres", genres);
		map.put("trailer", trailer);
		map.put("steelCuts", steelCuts);
		map.put("bookMarkCheck", bookmarksDAO.bookmarkCheck(bookmark));
		map.put("climBookMarkCheck", bookmarksDAO.bookmarkCheck(climBookmark));
		map.put("scoreCount", scoreCount);
		map.put("movieScore", reviewsDAO.selectMovieDetailScore(no));
		
		return map;
	}

}
