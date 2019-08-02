package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Subscribe;

public interface SubscribesService {
	public List<Subscribe> getList(int memberNo);
}
