package com.playus.clim.service;

import java.util.Map;

public interface BoardsService {
	
	public Map<String, Object> getMyBoards(int memberNo, int page);

	//게시판리스트 불러오기
	public Map<String, Object> getBoardList(int page);
	
	//게시판 디테일 불러오기
	public Map<String, Object> getBoardDetail(int no);
	
	public int deleteBoard(int no);
}
