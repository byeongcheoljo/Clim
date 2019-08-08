package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Subscribe;

public interface SubscribesService {
	public List<Subscribe> getList(int memberNo);

	public int subscribes(int memberNo,int userNo);

	
	public int addFollow(Subscribe subscribe);
	
	public int removeFollow(Subscribe subscribe);

}
