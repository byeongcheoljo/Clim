package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Comment;
import com.playus.clim.vo.PageVO;

public interface CommentsDAO {
	
	public List<Comment> myWriteCommentsList(PageVO pageVO);
	public int myWriteCommentsTotal(int memberNo);

	//게시판 댓글리스트 불러오깅
	public List<Comment> selectCommentList(PageVO pageVO);
	public int boardCommentTotal(int no);
	
	//게시판 댓글 작성하기
	public int insertComment(Comment comment);
	
	//댓글 삭제
	public int deleteComment(int boardNo);

	
	
}
