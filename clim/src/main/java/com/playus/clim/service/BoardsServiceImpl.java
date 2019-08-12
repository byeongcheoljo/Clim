package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BoardTagsDAO;
import com.playus.clim.dao.BoardsDAO;
import com.playus.clim.dao.BookmarksDAO;
import com.playus.clim.dao.CommentsDAO;
import com.playus.clim.dao.LikesDAO;
import com.playus.clim.util.PaginateUtil;
import com.playus.clim.vo.Board;
import com.playus.clim.vo.BoardTag;
import com.playus.clim.vo.Bookmark;
import com.playus.clim.vo.Comment;
import com.playus.clim.vo.Like;
import com.playus.clim.vo.PageVO;

@Service
public class BoardsServiceImpl implements BoardsService{
	
	/* 0802 홍성표 */
	@Autowired
	private BoardsDAO boardsDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	@Autowired
	private BookmarksDAO bookmarksDAO;
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private LikesDAO likesDAO;
	@Autowired
	private BoardTagsDAO boardTagsDAO;
	
	
	@Override
	public Map<String, Object> getMyBoards(int memberNo, int page) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(page, 10, memberNo);
		
		int total = boardsDAO.myWriteBoardsTotal(memberNo);
		
		map.put("boards", boardsDAO.myWriteBoardsList(pageVO));
		map.put("paginate", paginateUtil.getPaginate(page, total, 10, 5, "/ajax/member"+memberNo+"boards"));
		
		return map;
	}
	
	
	@Override
	public List<Bookmark> getMyMovieList(int no) {
		// TODO Auto-generated method stub
		return bookmarksDAO.mybookmarkListForMovies(no);
	}
	
	//게시판 목록 불러오기
	@Override
	public Map<String, Object> getBoardList(int page) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(page, 10);
		List<Board> boards = boardsDAO.boardList(pageVO);
		for (Board board : boards) {
			board.setBoardTags(boardTagsDAO.boardTagList(board.getNo()));
		}
		
		map.put("boards", boards);
		map.put("total", boardsDAO.boardTotal());
		return map;
	}
	
	@Override
	public Map<String, Object> selectBoardSearch(String contents) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		List<Board> boards = boardsDAO.selectBoardSearch("%"+contents+"%");
				
		for (Board board : boards) {
			board.setBoardTags(boardTagsDAO.boardTagList(board.getNo()));
		}
		//map.put("boardSearch", boardsDAO.selectBoardSearch("%"+contents+"%"));
		map.put("boardSearch", boards);
		return map;
	}
	
	@Override
	public Map<String, Object> getBoardDetail(int no, int page,int loginMember) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		Board board = boardsDAO.selectBoardDetail(no);
		//System.out.println(board.getViews()+"asd321321");
		board.setViews(board.getViews()+1);
		boardsDAO.boardViewUpdate(board);
		//System.out.println("ㅁㄴㅁㄴㅇㅇ"+boardsDAO.boardViewUpdate(board)+1);
		Like like = new Like();
		like.setBoardNo(no);
		like.setMemberNo(loginMember);
		board.setLikeCheck(1==likesDAO.boardLikeCheck(like));
		//System.out.println(1==likesDAO.boardLikeCheck(like));
		map.put("boardDetail", board);
		
		PageVO pageVO = new PageVO(page, 3, no);
		List<Comment> comments = commentsDAO.selectCommentList(pageVO);
		for (Comment comment : comments) {
			Like like2 = new Like();
			like2.setPostNo(comment.getNo());
			like2.setMemberNo(loginMember);
//			System.out.println(comment.getNo());
			comment.setLikeCommentCheck(1==likesDAO.boardCommentLikeCheck(like2));
//			System.out.println(1==likesDAO.boardCommentLikeCheck(like2));
		}
		System.out.println("여기 안오나?");
		map.put("comments", comments);
		int total = commentsDAO.boardCommentTotal(no);
		map.put("paginate", paginateUtil.getPaginate(page, total, 3, 5, "/ajax/boardDetail/"+no));
		return map;
	}
	
	//게시판 삭제
	@Override
	public Map<String, Object> deleteBoard(Board board, int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		//System.out.println(board.getNo()+"asdkjakl");
		Comment comment = new Comment();
		comment.setBoardNo(board.getNo());
		BoardTag boardTag = new BoardTag();
		boardTag.setBoardNo(board.getNo());
		
		//System.out.println(comment.getBoardNo()+"sadad");
		map.put("boardTagDelete", boardTagsDAO.boardTagDelete(boardNo));
		map.put("commentDelete", commentsDAO.deleteComment(boardNo));
		map.put("boardDelete", boardsDAO.deleteBoard(board));
		
		return map;
	}
	
	//게시판 작성하기
	@Override
	public int boardWrite(Board board, BoardTag boardTag) {
		boardsDAO.boardWrite(board);
		BoardTag bTag = new BoardTag();
		boardTag.setBoardNo(board.getNo());
		bTag.setTagName(board.getContents());
		
		System.out.println("내용물" + board.getContents());
	
		//String rrr= bTag.getTagName().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(/)?>", " ");
		//String rrr= bTag.getTagName().replaceAll("#", " ");
		//System.out.println("rrr은???"+rrr);
		
		String[] tag = bTag.getTagName().split(" ");
		
		String bContents = " ";

		for(int i =0; i<tag.length; i++) {
			if(tag[i].contains("#")) {
				System.out.println("태그 짜른거"+tag[i]);
				String rTag = tag[i].substring(4);
				System.out.println("rTag:"+rTag);
				boardTag.setTagName(tag[i].substring(4));
				boardTagsDAO.tagInsert(boardTag);
				//System.out.println(tag[i]+"잘린문자열");
			}else {
				System.out.println(tag[i]+"2222는 김근경짱");
				bContents = bContents + tag[i] + " ";
				System.out.println("그래서 태그가 없는 아이들은요? " + bContents);
				board.setContents(bContents);
				boardsDAO.boardUpdate(board);
			}
			
		}
		return 1;
	}
	
	
	
	
}
