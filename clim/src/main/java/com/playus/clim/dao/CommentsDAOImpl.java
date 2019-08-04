package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Comment;
import com.playus.clim.vo.PageVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Comment> myWriteCommentsList(PageVO pageVO) {
		return session.selectList("comments.myWriteCommentsList", pageVO);
	}
	
	@Override
	public int myWriteCommentsTotal(int memberNo) {
		return session.selectOne("comments.myWriteCommentsTotal",memberNo);
	}
	
	@Override
	public List<Comment> selectCommentList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("comments.boardCommentList", no);
	}
	
	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return session.insert("comments.insertComment", comment);
	}

}
