package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.PageVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Board> myWriteBoardsList(PageVO pageVO) {
		return session.selectList("boards.myWriteBoardsList", pageVO);
	}
	
	@Override
	public int myWriteBoardsTotal(int memberNo) {
		return session.selectOne("boards.myWriteBoardsTotal", memberNo);
	}
	
	@Override
	public List<Board> boardList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("boards.boardList", pageVO);
	}
	
	

}
