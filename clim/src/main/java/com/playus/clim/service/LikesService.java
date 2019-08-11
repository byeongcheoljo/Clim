package com.playus.clim.service;

import com.playus.clim.vo.Like;
import java.util.Map;

public interface LikesService {

	public Map<String, Object> boardLike(int memberNo, int boardNo);
	
	public Map<String, Object> boardCommentLike(int memberNo, int postNo);


	public int insertLike(Like like);

	public int deleteLike(Like like);


}
