package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Director;

@Repository
public class DirectorsDAOImpl implements DirectorsDAO{
	
	@Autowired
	private SqlSession session;
	
	// 재현
	@Override
	public List<Director> directorSelectList(int no) {
		return session.selectList("directors.directorSelectList",no);
	}
	// 재현

	@Override
	public List<Director> selectDirectorForMovie(int no) {
		return session.selectList("directors.selectDirectorForMovie",no);
	}
}
