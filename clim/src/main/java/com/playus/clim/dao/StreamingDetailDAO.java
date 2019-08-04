package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Leader;
import com.playus.clim.vo.Movie;

public interface StreamingDetailDAO {

	Leader selectLeader(int no);
	

	List<Movie> selectMovieLists(int no);

}
