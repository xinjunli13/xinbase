package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.ReportDetailsService;


@Controller
@RequestMapping(value="/report")
public class ReportDetailsController {

	@Autowired
	private ReportDetailsService detailsService;
	
	@RequestMapping(value = "/getTodayTurnover")
	public ModelAndView getTodayTurnover(){
		ModelAndView model = new ModelAndView("/user/usermainview");
		model.addObject("todayturnover", detailsService.getTodayTurnover());
		return model;
	}
	
	@RequestMapping(value = "/getYesterdayTurnover")
	public ModelAndView getYesterdayTurnover(){
		ModelAndView model = new ModelAndView("");
		model.addObject("yesterdayturnover", detailsService.getYesterdayTurnover());
		return model;
	}
	
	@RequestMapping(value = "/getMonthTurnover")
	public ModelAndView getMonthTurnover(){
		ModelAndView model = new ModelAndView("");
		model.addObject("monthturnover", detailsService.getMonthTurnover());
		return model;
	}
	
	@RequestMapping(value = "/getTodayCustomer")
	public ModelAndView getTodayCustomer(){
		ModelAndView model = new ModelAndView("");
		model.addObject("todaycustomer", detailsService.getTodayCustomer());
		return model;
	}
	
}
