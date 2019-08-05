package com.playus.clim.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playus.clim.vo.Member;
import com.playus.clim.vo.Payment;

@Repository
public class PaymentsDAOImpl implements PaymentsDAO{
	
	@Autowired
	private SqlSession session;

	
	@Override
	public Member getPayment(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("payments.selectOne", no);
	}
	
	
	@Override
	public int updatePaymentInfo(Payment payment) {
		// TODO Auto-generated method stub
		return session.update("payments.updatePayment", payment);
	}
	
@Override
	public int deletePaymentInfo(int no) {
		// TODO Auto-generated method stub
		return session.delete("payments.deletePayment", no);
	}
}
