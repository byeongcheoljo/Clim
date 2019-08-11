package com.playus.clim.dao;

import com.playus.clim.vo.Like;

public interface LikesDAO {

	public int checkLike(Like like);

	public int insertLike(Like like);

	public int countLike(Like like);

	public int countDisLike(Like like);

	public int deleteLike(Like like);

}
