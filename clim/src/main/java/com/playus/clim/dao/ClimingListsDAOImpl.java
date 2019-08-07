package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.ClimingList;
<<<<<<< HEAD
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;
=======
>>>>>>> master

@Repository
public class ClimingListsDAOImpl implements ClimingListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
<<<<<<< HEAD
	public List<ClimingList> selectList() {
		
		 List<ClimingList> climingList = session.selectList("climingLists.selectList");
		 //System.out.println("리스트! : "+climingList);
		 
		 return  climingList;
	}
	
	@Override
	public List<Movie> selectFeature() {
		
		return session.selectList("climingLists.selectFeatures");
	}
=======
	public void insert(ClimingList climingList) {
		System.out.println("z4");
		session.insert("climingLists.insert", climingList);
	}
	
	@Override
	public ClimingList selectOne(int no) {
		return session.selectOne("climingLists.selectOne", no);
	}

	public int subscribesLiveCheck(int memberNo) {
		return session.selectOne("climingLists.subscribesLiveCheck",memberNo);
	}
	
>>>>>>> master
}
