package com.playus.clim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.PaymentsDAO;
import com.playus.clim.dao.PaymentsDAOImpl;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Payment;

@Service
public class PaymentsServiceImpl implements PaymentsService{

	@Autowired
	private PaymentsDAO paymentsDAO;
	
	
	@Override
	public Member getPaymentOne(int no) {
		// TODO Auto-generated method stub
		return paymentsDAO.getPayment(no);
	}
	
	@Override
	public int updatePaymentInfo(Payment payment) {
		// TODO Auto-generated method stub
		return paymentsDAO.updatePaymentInfo(payment);
	}
	
	@Override
	public int deletePaymentInfo(int no) {
		// TODO Auto-generated method stub
		return paymentsDAO.deletePaymentInfo(no);
	}
	@Override
	public int defaultPaymentInfo(int no) {
		// TODO Auto-generated method stub
		return paymentsDAO.defaultPaymentInfo(no);
	}
}
