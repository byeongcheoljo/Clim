package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.PageVO;

public interface BoardsDAO {
	/* 0803 홍성표 */
	public List<Board> myWriteBoardsList(PageVO pageVO);
	public int myWriteBoardsTotal(int memberNo);
	
	//게시판 리스트 불러오기
	public List<Board> boardList(PageVO pageVO);
	public int boardTotal();
	
	//게시판 디테일
	public Board selectBoardDetail(int no);
	//게시판 좋아요 쳌
	public Board selectBoardLikeCheck(int no);
	//게시판 검색
	public List<Board> selectBoardSearch(String contents);
	//게시판 삭제
	public int deleteBoard(Board board);
	//게시판 작성
	public int boardWrite(Board board);
	//태그자르기위한 게시판 수정하기 
	public int boardUpdate(Board board);
	//게시판 조회수 증가
	public int boardViewUpdate(Board board);
		
}
