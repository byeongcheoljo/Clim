package com.playus.clim.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.BoardsService;
import com.playus.clim.vo.Board;
import com.playus.clim.vo.BoardTag;

@Controller
public class BoardController {
	
	@Autowired
	private BoardsService boardsService;
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardList() {
		
		return "board";
	}
	
	@RequestMapping(value="/boardWrite",method=RequestMethod.POST)
	public String boardWrite(Board board, BoardTag boardTag) {
		//System.out.println("zz여긴오나?");
		//System.out.println("132"+boardTag.getBoardNo());
		boardsService.boardWrite(board, boardTag);
		//System.out.println("엔오:"+board.getNo());
		//System.out.println("내용:"+board.getContents());
		return "redirect:/board";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
