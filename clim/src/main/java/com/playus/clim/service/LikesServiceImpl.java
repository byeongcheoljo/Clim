package com.playus.clim.service;

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
}
