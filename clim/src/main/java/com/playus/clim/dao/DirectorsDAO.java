package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Director;

public interface DirectorsDAO {
	public List<Director> selectDirectorForMovie(int no);
}
