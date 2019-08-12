package com.playus.clim.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.StealCut;
import com.playus.clim.vo.Survey;
import com.playus.clim.vo.Trailer;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Autowired
	private MoviesDAO moviesDAO;
	@Autowired
	private SteelCutsDAO steelcutsDAO;
	@Autowired
	private ActorsDAO actorsDAO;
	@Autowired
	private DirectorsDAO directorsDAO;
	@Autowired
	private BookmarksDAO bookmarksDAO;
	@Autowired
	private GenresDAO genresDAO;
	@Autowired
	private TrailersDAO trailersDAO;
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private SurveysDAO surveysDAO;
	
	@Override
	public List<Movie> getSearchResultForcliming(String title) {
		return moviesDAO.searchMovieListForCliming(title);
	}

	/*김근경 시작*/
	//index에서 끌림작 1위~30위
	@Override
	public List<Movie> getClimedList() {
		List<Movie> movies = moviesDAO.indexClimedList();

		for(Movie movie: movies) {
			
			int movieNo = movie.getNo();		
			int srcNumber= steelcutsDAO.selectTotalForMovieId(movieNo);
			
			int randomR= (int)(Math.random()*srcNumber)+1;//movieNo의 스틸컷을 랜덤하게 출력하기 위해
			
			StealCut stealCut = new StealCut();
			stealCut.setRandomR(randomR);
			stealCut.setMovieNo(movieNo);
			
			movie.setRecSteal(steelcutsDAO.selectOneForClimed(stealCut));
		}
		System.out.println(movies);
		return movies;
	}
	
	//index에서 추천작1~3
	@Override
	public Map<String, Object> getRecommandationList() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("recOne",moviesDAO.indexRecommandationListOne());//추천작1
		map.put("recTwo",moviesDAO.indexRecommandationListTwo());//추천작2
		map.put("recThree",moviesDAO.indexRecommandationListThree());//추천작3		
		return map;
	}
	
	//index에서 추천작4
	@Override
	public List<Movie> getRecommandationListFour() {
		List<Movie> movies = moviesDAO.indexRecommandationListFour();
		
		for(Movie movie:movies) {
			
			int movieNo = movie.getNo();
			
			System.out.println("getNo: "+movie.getNo());
			int srcNumber = steelcutsDAO.selectTotalForMovieId(movieNo);
			
			int randomR = (int)(Math.random()*srcNumber)+1;
			
			System.out.println("random : " + randomR);
			
			StealCut stealCut = new StealCut();
			stealCut.setRandomR(randomR);
			stealCut.setMovieNo(movieNo);
			
			movie.setRecSteal(steelcutsDAO.selectOneForClimed(stealCut));

			
		}
		return movies;
	}
	
	
	//index에서 장르1~3
	@Override
	public Map<String, Object> getGenreList() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("genreOne",moviesDAO.indexGenreListOne());//장르1 드라마
		map.put("genreTwo",moviesDAO.indexGenreListTwo());//장르2 액션
		map.put("genreThree",moviesDAO.indexGenreListThree());//장르3 모험
		return map;
	}
	
	@Override
	public String getPoster(String src) {
		return moviesDAO.selectPoster(src);
	}
	
/*김근경 끝*/
	
	@Override
	public Map<String, Object> getMovieTrailer(int movieNo,int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Movie movies = moviesDAO.selectMovieTrailer(movieNo);
		if(memberNo!=0){
		Bookmark bookmark = new Bookmark();
		bookmark.setMemberNo(memberNo);
		bookmark.setMovieNo(movieNo);
		bookmark.setType('B');
		movies.setBookmarkCheck(1==bookmarksDAO.bookmarkCheck(bookmark));
		}
		map.put("movie",movies);
		map.put("directors",directorsDAO.selectDirectorForMovie(movieNo));
		map.put("actors",actorsDAO.selectListForMovie(movieNo));
		return map;
	}

	@Override
	public Movie getMovie(int movieNo) {
		return moviesDAO.selectMovie(movieNo);
	}
	@Override
	public Map<String, Object> getMovieDetail(int no, int loginMemberNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Movie movie = moviesDAO.movieSelectOne(no);
		List<Director> directors = directorsDAO.directorSelectList(no);
		List<Actor> actors = actorsDAO.actorSelectList(no);
		List<Genre> genres = genresDAO.genreSelectList(no);
		Trailer trailer = trailersDAO.trailerSelectOne(no);
		List<StealCut> steelCuts = steelcutsDAO.steelCutSelectList(no);
		
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
		map.put("bookMarkCheck", bookmarksDAO.bookmarkChecWithType(bookmark));
		map.put("climBookMarkCheck", bookmarksDAO.bookmarkChecWithType(climBookmark));
		map.put("scoreCount", scoreCount);
		map.put("movieScore", reviewsDAO.selectMovieDetailScore(no));
		
		return map;
	}
}
