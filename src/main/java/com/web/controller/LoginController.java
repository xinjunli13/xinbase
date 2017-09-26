package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.UserBean;
import com.web.service.LoginService;
import com.web.service.ReportDetailsService;
import com.web.service.UserBeanService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ReportDetailsService detailsService;
	
	@Autowired
	private UserBeanService userBeanService;
	//登陆
	@RequestMapping(value = "/getLoginUser",method = RequestMethod.POST)
	public ModelAndView getLoginuser(UserBean userBean,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String validate = request.getParameter("validate");
		
		String validatecode = (String) request.getSession().getAttribute("validateCode");
		UserBean bean = loginService.getLoginUser(userBean);
		if(validate.equals(validatecode))
		{	
			if(bean != null && !bean.equals(""))
			{
				request.getSession().setAttribute("userBean", bean);
				mv = new ModelAndView("/user/usermainview");//地址换
				int id = bean.getId();    
			    request.getSession().setAttribute("resources", userBeanService.getResources(id));
				mv.addObject("todayturnover", detailsService.getTodayTurnover());
				mv.addObject("yesterdayturnover", detailsService.getYesterdayTurnover());
				mv.addObject("monthturnover", detailsService.getMonthTurnover());
				mv.addObject("todaycustomer", detailsService.getTodayCustomer());
				return mv;
			}
			else
			{
				mv = new ModelAndView("login");
				mv.addObject("msg", "用户名或密码错误!");
				return mv;
			}
		}
		else
		{
			mv = new ModelAndView("login");
			mv.addObject("msg", "验证码错误!");
			return mv;
		}
	}
	
	//首页
	@RequestMapping(value = "/getMainView")
	public ModelAndView getMainView(){
		ModelAndView mv = new ModelAndView("/user/usermainview");
		mv.addObject("todayturnover", detailsService.getTodayTurnover());
		mv.addObject("yesterdayturnover", detailsService.getYesterdayTurnover());
		mv.addObject("monthturnover", detailsService.getMonthTurnover());
		mv.addObject("todaycustomer", detailsService.getTodayCustomer());
		return mv;
	}
	
	
	
	//注销
	@RequestMapping(value = "/loginOut")
	public ModelAndView loginOut(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/login");
		request.getSession().removeAttribute("userBean");
		request.getSession().invalidate();
		return mv;
	}
}
