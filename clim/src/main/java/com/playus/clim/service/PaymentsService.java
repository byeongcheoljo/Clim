package com.playus.clim.service;

import com.playus.clim.dao.PaymentsDAO;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Payment;

public interface PaymentsService {
	
	public Member getPaymentOne(int no);
	
	public int updatePaymentInfo(Payment payment);
	
	public int deletePaymentInfo(int no);
	
}
