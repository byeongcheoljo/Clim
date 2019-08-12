package com.playus.clim.service;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.LikesDAO;
import com.playus.clim.vo.Like;

@Service
public class LikesServiceImpl implements LikesService{

	@Autowired
	private LikesDAO likesDAO;
	
	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.insertLike(like);
	}
	
	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.deleteLike(like);
	}

		
	public Map<String, Object> boardLike(int memberNo, int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		Like like = new Like();
		like.setBoardNo(boardNo);
		like.setMemberNo(memberNo);
		int count = likesDAO.boardLikeCheck(like);
		//flag = likeCheck!=null;
		if(count==1) {
			map.put("likeDown", likesDAO.boardLikeDown(like));
		} else {
			map.put("likeUp", likesDAO.boardLikeUp(like));
		}
		map.put("likeTotal", likesDAO.boardLikeTotal(boardNo));
		//map.put("flag", flag);
		map.put("count", count);
		//map.put("boardLikeCheck", likesDAO.boardLikeCheck(likeCheck));
		return map;
	}
	
	
	@Override
	public Map<String, Object> boardCommentLike(int memberNo, int postNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		boolean flag = false;
		Like like = new Like();
		//like.setBoardNo("댓글"+boardNo);
		//like.setMemberNo("댓글멤버"+memberNo);
		like.setMemberNo(memberNo);
		like.setPostNo(postNo);
		//Like likeCommentCheck = likesDAO.boardCommentLikeCheck(like);
		int count = likesDAO.boardCommentLikeCheck(like);
		//flag = likeCommentCheck!=null;
		if(count==1) {
			map.put("likeCommentDown", likesDAO.boardCommentLikeDown(like));
		} else {
			map.put("likeCommentUp", likesDAO.boardCommentLikeUp(like));
		}
		map.put("likeCommentTotal", likesDAO.boardCommentLikeTotal(postNo));
		//map.put("flag", flag);
		map.put("count", count);

		
		return map;
	}
}
