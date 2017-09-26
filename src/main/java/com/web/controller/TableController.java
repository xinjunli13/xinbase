package com.web.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Tables;
import com.web.service.TableService;
import com.web.util.PageUtil;

@Controller
@RequestMapping(value = "/tables")
public class TableController {
	
	//每页个数
	private int pageCount = 8;

	@Autowired
	private TableService tableService;
	
	@RequestMapping(value = "/getTables")
	public ModelAndView getTables(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/table/table");
		String nowpage = request.getParameter("nowpage");//没写
		int totalCount = tableService.getTotalCount();
		if(nowpage==null || "".equals(nowpage)){
			mv.addObject("tables",tableService.getTablesBypage(1,pageCount) );
			mv.addObject("nowpage", 1);
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, 1, pageCount));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		else{
			mv.addObject("tables", tableService.getTablesBypage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount));
			//List<Menus> list = menuService.getMenusByPage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount+1);
			mv.addObject("nowpage", Integer.valueOf(nowpage));
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, Integer.valueOf(nowpage), pageCount));
			mv.addObject("hasPre", PageUtil.isHasPre(Integer.valueOf(nowpage)));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/updateTable",method = RequestMethod.POST)
	public ModelAndView updateTable(Tables tables){
		ModelAndView mv = new ModelAndView("/table/tableEdit");
		tableService.updateTable(tables);
		mv.addObject("table", tableService.getOneTable(tables.getId()));
		mv.addObject("tableEdit", true);
		return mv;	
	}
	
	@RequestMapping(value = "/getUpdateTable")
	public ModelAndView getUpdateTable(@RequestParam String id){
		ModelAndView mv = new ModelAndView("/table/tableEdit");
		mv.addObject("table", tableService.getOneTable(Integer.valueOf(id)));
		return mv;
	}
	
	@RequestMapping(value = "/addTables",method = RequestMethod.POST)
	public String addTables(Tables tables){
		tableService.addTables(tables);
		return "redirect:/tables/getTables";
	}
}
