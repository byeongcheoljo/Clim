package com.playus.clim.service;

import com.playus.clim.vo.Like;

public interface LikesService {
	public int insertLike(Like like);

	public int deleteLike(Like like);
}
