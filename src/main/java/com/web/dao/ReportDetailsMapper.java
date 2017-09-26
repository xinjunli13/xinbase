package com.web.dao;

import java.util.List;

import com.web.entity.ReportDetails;

public interface ReportDetailsMapper {
	
		List<ReportDetails> getTodayTurnover();
		
		List<ReportDetails> getYesterdayTurnover();
		
		List<ReportDetails> getMonthTurnover();
		
		List<ReportDetails> getTodayCustomer();

}
