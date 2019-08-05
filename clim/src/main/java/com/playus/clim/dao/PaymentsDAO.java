package com.playus.clim.dao;

import com.playus.clim.vo.Member;
import com.playus.clim.vo.Payment;

public interface PaymentsDAO {

	
	public Member getPayment(int no);
	
	public int updatePaymentInfo(Payment payment);
	public int deletePaymentInfo(int no);
	
}
