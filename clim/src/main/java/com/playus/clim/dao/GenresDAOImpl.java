package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Genre;

@Repository
public class GenresDAOImpl implements GenresDAO{
	
	@Autowired
	private SqlSession session;
	
	//재현
	@Override
	public List<Genre> genreSelectList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("genres.genresSelectList", no);
	}

}
