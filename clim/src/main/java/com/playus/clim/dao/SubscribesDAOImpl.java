package com.playus.clim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Subscribe;

@Repository
public class SubscribesDAOImpl implements SubscribesDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<Subscribe> selectList(int memberNo) {
		return session.selectList("subscribes.subscribesList", memberNo);

	}

	@Override
	public int subscribesCheck(Subscribe subscribe) {
		return session.selectOne("subscribes.subscribesCheck",subscribe);
	}
	
	@Override
	public int insert(Subscribe subscribe) {
		return session.insert("subscribes.insert",subscribe);
	}
	
	@Override
	public int delete(Subscribe subscribe) {
		return session.delete("subscribes.delete",subscribe);
	}
}
