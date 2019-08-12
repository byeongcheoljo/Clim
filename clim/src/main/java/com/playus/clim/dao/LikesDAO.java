package com.playus.clim.dao;

import com.playus.clim.vo.Like;

public interface LikesDAO {

	//게시판 게시글 좋아요
	public int boardLikeDown(Like like);
	public int boardLikeUp(Like like);
	public int boardLikeCheck(Like like);
	public int boardLikeTotal(int boardNo);
	
	//게시판 게시글 댓글 좋아용
	public int boardCommentLikeUp(Like like);
	public int boardCommentLikeDown(Like like);
	public int boardCommentLikeCheck(Like like);
	public int boardCommentLikeTotal(int postNo);
	
}
