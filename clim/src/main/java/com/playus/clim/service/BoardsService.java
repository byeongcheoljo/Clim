package com.playus.clim.service;

import java.util.List;
import java.util.Map;


import com.playus.clim.vo.Bookmark;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.BoardTag;
import com.playus.clim.vo.Comment;
import com.playus.clim.vo.Like;


public interface BoardsService {
	
	/* 0802 홍성표 */
	public Map<String, Object> getMyBoards(int memberNo, int page);

	public List<Bookmark> getMyMovieList(int no);

	//게시판리스트 불러오기
	public Map<String, Object> getBoardList(int page);
	
	//게시판 디테일 불러오기
	public Map<String, Object> getBoardDetail(int no, int page,int loginMember);
	
	public Map<String, Object> deleteBoard(Board board, int boardNo);
	
	public int boardWrite(Board board, BoardTag boardTag);
	
	//게시판 검색
	public Map<String, Object> selectBoardSearch(String contents);

	
}
