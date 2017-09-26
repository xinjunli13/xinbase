package com.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Menus;
import com.web.service.MenuService;
import com.web.service.MenuTypeService;
import com.web.util.PageUtil;

@Controller
@RequestMapping(value = "/menus")
public class MenuController {
	
	//每页数量
	private int pageCount = 8;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MenuTypeService menuTypeService;

	@RequestMapping(value = "/getMenus")
	public ModelAndView getMenus(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/menu/menu");
		String nowpage = request.getParameter("nowpage");//没写
		int totalCount = menuService.getTotalCount();
		if(nowpage==null || "".equals(nowpage)){
			mv.addObject("menus",menuService.getMenusByPage(1,pageCount+1) );
			mv.addObject("nowpage", 1);
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, 1, pageCount));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		else{
			mv.addObject("menus", menuService.getMenusByPage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount+1));
			//List<Menus> list = menuService.getMenusByPage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount+1);
			mv.addObject("nowpage", Integer.valueOf(nowpage));
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, Integer.valueOf(nowpage), pageCount));
			mv.addObject("hasPre", PageUtil.isHasPre(Integer.valueOf(nowpage)));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		return mv;
	}
	
	@RequestMapping(value = "/getOneMenu")
	public ModelAndView getOneMenu(@RequestParam int id){
		ModelAndView mv = new ModelAndView("/menu/menuEdit");
		mv.addObject("menu",menuService.getOneMenu(id));
		mv.addObject("menutypelist",menuTypeService.getMtList());
		return mv;
	}
	
	@RequestMapping(value = "/getOneMenuAdd")
	public ModelAndView getOneMenuAdd(){
		ModelAndView mv = new ModelAndView("/menu/menuAdd");
		mv.addObject("menutypelist",menuTypeService.getMtList());
		
		return mv;
	}
	
	@RequestMapping(value = "/getPreMenu" ,method = RequestMethod.GET)
	public ModelAndView getPreMenu(@RequestParam int id){
		ModelAndView mv = new ModelAndView("/menu/menuPre");
		mv.addObject("menu",menuService.getOneMenu(id));
		mv.addObject("menutypelist", menuTypeService.getMtList());
		return mv;
	}
	
	@RequestMapping(value = "/updateMenu",method = RequestMethod.POST)
	public ModelAndView updateMenu(HttpServletRequest request,
			HttpServletResponse response,Menus menus)throws Exception{
		ModelAndView mv = new ModelAndView("");
		menuService.updateMenu(menus, request);
		return mv;
	}
	
	@RequestMapping(value = "/addMenu")
	public ModelAndView addMenu(HttpServletRequest request,
			HttpServletResponse response,Menus menus)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/menus/getMenus");
		menuService.addMenu(menus, request);
		return mv;
	}
	
	@RequestMapping(value = "/deleteMenu",method = RequestMethod.GET)
	@ResponseBody
	public String deleteMenu(@RequestParam String id, HttpServletRequest request){
		//ModelAndView mv = new ModelAndView("");
		menuService.deleteMenu(Integer.valueOf(id),request);
		return "success:success";
	}
	
}
