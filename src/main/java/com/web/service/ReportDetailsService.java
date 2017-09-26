package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ReportDetailsMapper;
import com.web.entity.ReportDetails;

@Service
public class ReportDetailsService {
	
	@Autowired
	private ReportDetailsMapper detailsMapper;

	public List<ReportDetails> getTodayTurnover(){
		return detailsMapper.getTodayTurnover();
	}
	
	public List<ReportDetails> getYesterdayTurnover(){
		return detailsMapper.getYesterdayTurnover();
	}
	
	public List<ReportDetails> getMonthTurnover(){
		return detailsMapper.getMonthTurnover();
	}
	
	public List<ReportDetails> getTodayCustomer(){
		return detailsMapper.getTodayCustomer();
	}
}
