package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.BoardTag;

public interface BoardTagsDAO {

	
	public int tagInsert(BoardTag boardTag);
	
	public List<BoardTag> boardTagList(int boardNo); 
		
}
