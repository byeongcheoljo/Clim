package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.PageVO;

public interface BoardsDAO {
	
	public List<Board> myWriteBoardsList(PageVO pageVO);
	public int myWriteBoardsTotal(int memberNo);
	

}
