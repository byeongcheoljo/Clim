package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Clim;
import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;

@Repository
public class ClimingListsDAOImpl implements ClimingListsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ClimingList> selectList() {
		
		 List<ClimingList> climingList = session.selectList("climingLists.selectList");
		 //System.out.println("리스트! : "+climingList);
		 
		 return  climingList;
	}
	
	@Override
	public Clim selectFeature(String src) {
		return session.selectOne("climingLists.selectFeatures", src);
	}
	
	@Override
	public void insert(ClimingList climingList) {
		System.out.println("z4");
		session.insert("climingLists.insert", climingList);
	}
	
	@Override
	public ClimingList selectOne(int no) {
		return session.selectOne("climingLists.selectOne", no);
	}
	@Override
	public int subscribesLiveCheck(int memberNo) {
		return session.selectOne("climingLists.subscribesLiveCheck",memberNo);
	}
	@Override
	public void updateSessionId(ClimingList clim) {
		// TODO Auto-generated method stub
		session.update("climingLists.updateSessionId",clim);
		
	}
	
	@Override
	public List<ClimingList> subscribesClimingList() {
		return session.selectList("climingLists.subscribesClimingList");
	}
	
	@Override
	public List<ClimingList> selectUserList(int no) {
		return session.selectList("climingLists.selectUserList", no);
	}
	
}
