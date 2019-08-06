package com.playus.clim.dao;

import com.playus.clim.vo.StealCut;

public interface SteelCutsDAO {
	

/*김근경 시작*/
	
	//index에서 끌림작
	//=>movieNo의 total(스틸컷) 개수와 movie_no 인 2가지를 stealCut에 받음.
	public String selectOneForClimed(StealCut stealCut);

	//movieNo의 스틸컷의 개수를 불러오기위한 total
	public int selectTotalForMovieId(int no);
	
/*김근경 끝*/	
}
