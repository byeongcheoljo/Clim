package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.BoardTag;

@Repository
public class BoardTagsDAOImpl implements BoardTagsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int tagInsert(BoardTag boardTag) {
		// TODO Auto-generated method stub
		return session.insert("boardTags.boardTag", boardTag);
	}

	@Override
	public List<BoardTag> boardTagList(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("boardTags.boardTagList", boardNo);
	}
	
	@Override
	public int boardTagDelete(int boardNo) {
		// TODO Auto-generated method stub
		return session.delete("boardTags.boardTagDelete", boardNo);
	}

}
