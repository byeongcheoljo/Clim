package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Board;
import com.playus.clim.vo.PageVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO{
	/* 0803 홍성표 */
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
	
	@Override
	public int boardTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("boards.boardTotal");
	}
	
	@Override
	public Board selectBoardDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.boardDetail", no);
	}
	
	@Override
	public Board selectBoardLikeCheck(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.boardLikeCheck", no);
	}
	
	@Override
	public int deleteBoard(Board board) {
		// TODO Auto-generated method stub
		return session.delete("boards.deleteBoard", board);
	}
	
	//게시글 작성
	@Override
	public int boardWrite(Board board) {
		// TODO Auto-generated method stub
		return session.insert("boards.writeBoard", board);
	}
	
	//게시판검색
	@Override
	public List<Board> selectBoardSearch(String contents) {
		// TODO Auto-generated method stub
		return session.selectList("boards.searchBoard", contents);
	}
	
	@Override
	public int boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return session.update("boards.boardUpdate", board);
	}
	
	@Override
	public int boardViewUpdate(Board board) {
		// TODO Auto-generated method stub
		return session.update("boards.boardViewUpdate", board);
	}
	

}
