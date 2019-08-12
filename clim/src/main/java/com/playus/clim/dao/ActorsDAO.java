package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Actor;

public interface ActorsDAO {
	public List<Actor> selectListForMovie(int no);
	List<Actor> actorSelectList(int no);
}
