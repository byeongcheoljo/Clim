package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Leader;
import com.playus.clim.vo.Movie;

@Repository
public class StreamingDetailDAOImpl implements StreamingDetailDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public Leader selectLeader(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("members.selectClimingLeader",no);
	}
	@Override
	public List<Movie> selectMovieLists(int no) {
		// TODO Auto-generated method stub
		List<Movie> movie = session.selectList("movies.getClimingMovieList",no);
//		System.out.println(movie.size());
//		for (Movie movie2 : movie) {
//			System.out.println(movie2.getPoster());
//		}
		return movie;
	}
}
