package com.playus.clim.dao;

import java.util.List; 

import com.playus.clim.vo.Subscribe;

public interface SubscribesDAO {
	public List<Subscribe> selectList(int memberNo);
	public int subscribesCheck(Subscribe subscribe);
	public int insert(Subscribe subscribe);
	public int delete(Subscribe subscribe);
}
