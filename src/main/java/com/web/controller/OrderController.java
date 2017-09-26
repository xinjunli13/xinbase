package com.web.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Orders;
import com.web.service.MenuService;
import com.web.service.OrderService;
import com.web.service.TableService;
import com.web.util.PageUtil;

@Controller
@RequestMapping(value = "/orders")
public class OrderController {
	
	//每页个数
	private int pageCount = 8;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private TableService tableService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "/getOrders")
	public ModelAndView getOrdersByPage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/order/order");
		
		String nowpage = request.getParameter("nowpage");//没写
		int totalCount = orderService.getTotalCount();
		if(nowpage==null || "".equals(nowpage)){
			mv.addObject("orders",orderService.getOrderByPage(1,pageCount) );
			List<Orders> list = orderService.getOrderByPage(1,pageCount);
			mv.addObject("nowpage", 1);
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, 1, pageCount));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		else{
			mv.addObject("orders", orderService.getOrderByPage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount));
			List<Orders> list = orderService.getOrderByPage((Integer.valueOf(nowpage)-1)*pageCount+1,(Integer.valueOf(nowpage))*pageCount);
			mv.addObject("nowpage", Integer.valueOf(nowpage));
			mv.addObject("hasNext",PageUtil.isHasNext(totalCount, Integer.valueOf(nowpage), pageCount));
			mv.addObject("hasPre", PageUtil.isHasPre(Integer.valueOf(nowpage)));
			mv.addObject("totalPage", PageUtil.getTotalPage(totalCount, pageCount));
		}
		
		mv.addObject("menus", menuService.getAllMenus());
		mv.addObject("tables", tableService.getAllTables());
		return mv;
	}
	
	@RequestMapping(value = "/getOneUpdateOrder",method = RequestMethod.GET)
	public ModelAndView getOneUpdateOrder(@RequestParam int id ){
		ModelAndView mv  = new ModelAndView("/order/orderEdit");
		Orders orders = orderService.getOneOrder(id);
		mv.addObject("menus", menuService.getAllMenus());
		mv.addObject("tables", tableService.getAllTables());
		mv.addObject("order", orders);
		return mv;
	}
	
	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	public ModelAndView addOrder(Orders orders,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/orders/getOrders");
		String[] ids = request.getParameterValues("menuIds");
		orderService.addOrder(orders,ids);//判断IDS空
		return mv;
	}
	
	
	@RequestMapping(value = "/updateOrder" ,method = RequestMethod.POST)
	public ModelAndView updateOrder(Orders orders,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/order/orderEdit");
		String[] ids = request.getParameterValues("menuIds");
		orderService.updateOrder(orders,ids);
		return mv;
	}
	
	@RequestMapping(value = "/deleteOrder",method = RequestMethod.GET)
	public String deleteOrder(@RequestParam int id){
		orderService.deleteOrder(id);
		return "redirect:/orders/getOrders";
	}

	
}
