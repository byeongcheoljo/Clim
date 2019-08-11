package com.playus.clim.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.playus.clim.service.BoardsService;
import com.playus.clim.service.CommentsService;
import com.playus.clim.service.LikesService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.ReportsService;
import com.playus.clim.service.ReviewsService;
import com.playus.clim.util.FileRenameUtil;
import com.playus.clim.vo.Board;
import com.playus.clim.vo.Comment;
import com.playus.clim.vo.Like;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;
import com.playus.clim.vo.Report;

@RestController
@RequestMapping(value = "/ajax")
public class AjaxController {
	
	@Autowired
	private BoardsService boardsService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ReviewsService reviewsService;
	@Autowired
	private MoviesService moviesService;
	@Autowired
	private ReportsService reportsService;
	@Autowired
	private FileRenameUtil fileRenameUtil;
	@Autowired
	private LikesService likesService;
	
	@RequestMapping(value = "/member/{memberNo}/boards/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyBoards(@PathVariable int memberNo, @PathVariable int page){
		
		return boardsService.getMyBoards(memberNo, page);
	}
	
	@RequestMapping(value = "/member/{memberNo}/comments/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyComments(@PathVariable int memberNo, @PathVariable int page){
		
		return commentsService.getMyComments(memberNo, page);
	}
	
	@RequestMapping(value = "/member/{memberNo}/reviews/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> getMyReviews(@PathVariable int memberNo, @PathVariable int page){
		return reviewsService.getMyReviews(memberNo, page);
	}
	
	@RequestMapping(value = "/climingSearch/{title}", method = RequestMethod.GET)
	public List<Movie> getSearchResultForcliming(@PathVariable String title){
		return moviesService.getSearchResultForcliming(title);
	}
	
	//게시판목록불러오기
	@RequestMapping(value="/boardList/{page}", method=RequestMethod.GET)
	public Map<String, Object> getBoardList(@PathVariable int page){
		return boardsService.getBoardList(page);
	}
	
	@RequestMapping(value="/boardDetail/{no}/page/{page}", method=RequestMethod.GET)
	public Map<String, Object> getBoardDetail(@PathVariable int no, @PathVariable int page, HttpSession session){
		//System.out.println("엔오:"+no);
		//System.out.println("페이지:"+page);
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberNo = loginMember.getNo();
		return boardsService.getBoardDetail(no, page, memberNo);
	}
	
	//댓글 작성하기
	@RequestMapping(value="/commentWrite", method=RequestMethod.POST)
	public void commentWrite(Comment comment) {
		//System.out.println(comment.getMemberNo());
		//System.out.println(comment.getContents());
		//System.out.println(comment.getBoardNo());
		commentsService.insertComment(comment);
	}
	
	//자유게시판 신고하기
	@RequestMapping(value="/boardDetail/reportWrite", method=RequestMethod.POST)
	public void boardReport(Report report) {
		//System.out.println("신고당한유저:"+report.getReporteredNo());
		//System.out.println("신고한 유저:"+report.getReporterNo());
		//System.out.println("신고한 게시글번호:"+report.getBoardNo());
		reportsService.boardReportInsert(report);
	}
	
	//게시글 삭제하기
	@RequestMapping(value="/deleteBoard", method=RequestMethod.DELETE)
	public Map<String, Object> deleteBoard(@RequestBody Board board) {
		//System.out.println("보드엔오는?" + board.getNo());
		int boardNo = board.getNo(); 
		return boardsService.deleteBoard(board, boardNo);
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String upload(HttpServletRequest request, MultipartFile uploadImg) {
		ServletContext sc = request.getServletContext();
		String uploadPath = sc.getRealPath("upload");
		//System.out.println("에러확인1"+uploadPath);
		File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());
		//System.out.println("에러확인2"+uploadImg.getOriginalFilename());
		//System.out.println("에러3:"+file);
		file = fileRenameUtil.rename(file);
		try {
			uploadImg.transferTo(file);
			return "{\"src\":\"" + file.getName() + "\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "에러";
		}
	}

	@RequestMapping(value="/boardLike", method=RequestMethod.POST)
	public Map<String, Object> boardLike(int memberNo, int boardNo){
		
		return likesService.boardLike(memberNo, boardNo);
	}
	
	@RequestMapping(value="/boardCommentLikeUp", method=RequestMethod.POST)
	public Map<String, Object> boardCommentLike(int memberNo, int postNo){
		return likesService.boardCommentLike(memberNo, postNo);
	}
	
	@RequestMapping(value="/boardSearch", method=RequestMethod.GET)
	public Map<String, Object> boardSearch(String contents) {
		return boardsService.selectBoardSearch(contents);
	}
	
	
	
	
}
