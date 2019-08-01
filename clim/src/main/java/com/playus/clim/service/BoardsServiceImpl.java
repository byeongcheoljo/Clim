package com.playus.clim.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.BoardsDAO;
import com.playus.clim.util.PaginateUtil;
import com.playus.clim.vo.PageVO;

@Service
public class BoardsServiceImpl implements BoardsService{
	
	@Autowired
	private BoardsDAO boardsDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	
	@Override
	public Map<String, Object> getMyBoards(int memberNo, int page) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(page, 10, memberNo);
		
		int total = boardsDAO.myWriteBoardsTotal(memberNo);
		
		map.put("boards", boardsDAO.myWriteBoardsList(pageVO));
		map.put("paginate", paginateUtil.getPaginate(page, total, 10, 5, "/ajax/member"+memberNo+"boards"));
		
		return map;
	}
	
}
