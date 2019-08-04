package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.PageVO;

public interface BoardsDAO {
	
	public List<Board> myWriteBoardsList(PageVO pageVO);
	public int myWriteBoardsTotal(int memberNo);
	
	//게시판 리스트 불러오기
	public List<Board> boardList(PageVO pageVO);
	public int boardTotal();
	
	//게시판 디테일
	public Board selectBoardDetail(int no);
	//게시판 삭제
	public int deleteBoard(int no);

}
