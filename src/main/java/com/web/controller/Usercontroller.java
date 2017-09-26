package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Resources;
import com.web.entity.UserBean;
import com.web.service.UserBeanService;

@Controller
@RequestMapping(value = "/userBean")
public class Usercontroller {
	
	@Autowired
	private UserBeanService userBeanService;
	
	@RequestMapping(value = "/getResources")
	public List<Resources> getResources(HttpServletRequest request){
		UserBean bean = (UserBean) request.getAttribute("userBean");
		int id = bean.getId();
		return userBeanService.getResources(id);
	}
	
	@RequestMapping(value = "/getOneUser")
	public ModelAndView getOneUser(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/user/userInfo");
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		UserBean bean = userBeanService.getUserBean(userBean.getId());
		mv.addObject("user", bean);
		return mv;
	}
	
	@RequestMapping(value = "/updateUserBean",method = RequestMethod.POST)
	public ModelAndView updateUserBean(HttpServletRequest request ,UserBean user){
		ModelAndView mv = new ModelAndView("/user/userInfo");
		/*UserBean bean = (UserBean) request.getAttribute("userBean");
		int id = bean.getId();*/
		userBeanService.updateUserBean(user);
		UserBean userBean = userBeanService.getUserBean(user.getId());
		request.getSession().removeAttribute("userBean");
		request.getSession().setAttribute("userBean", userBean);
		mv.addObject("edituser", "success");
		mv.addObject("user", userBean);
		return mv;
	}

}
