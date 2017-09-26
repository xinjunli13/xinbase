package com.web.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.OrderDetailsMapper;
import com.web.dao.OrderMapper;
import com.web.entity.OrderDetails;
import com.web.entity.Orders;


@Service
@Transactional
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderDetailsMapper orderDetailsMapper;
	
	public List<Orders> getOrderByPage(int count1,int count2){
		List<Orders> orders = new ArrayList<Orders>();
		List<Orders> orders2 = new ArrayList<Orders>();
		orders = orderMapper.getOrdersList();
		if(count2>=orders.size()){
			count2 = orders.size();
		}
		for (int i = count1-1; i <= count2-1; i++) {
			Orders order = new Orders();
			order = orders.get(i);
			orders2.add(order);
		}
		return orders2;
				
	}
	
	public int getTotalCount(){
		return orderMapper.getTotalcount();
	}
	
	public Orders getOneOrder(int id){
	
		return orderMapper.getOneOrder(id);
	}
	
	public void addOrder(Orders orders,String[] ids){
		
		
		/*数据库 字段不符*/
		/*int aa = UUID.randomUUID().clockSequence();*/
		/*暂时用date*/
		int orderid = (int) new Date().getTime();
		orders.setId(orderid);
		for (String string : ids) {
			OrderDetails orderDetails = new OrderDetails();
			orderDetails.setMenuId(Integer.valueOf(string));
			orderDetails.setOrderId(orderid);
			orderDetails.setNum(1);
			orderDetailsMapper.insertOrderDetails(orderDetails);
		}
		
		orderMapper.addOrder(orders);
	}
	
	//先删除在增加---修改
	public void updateOrder(Orders orders,String[] ids){
		orderDetailsMapper.deleteOrderDetails(orders.getId());
		for (String string : ids) {
			OrderDetails orderDetails = new OrderDetails();
			orderDetails.setMenuId(Integer.valueOf(string));
			orderDetails.setOrderId(orders.getId());
			orderDetails.setNum(1);
			orderDetailsMapper.insertOrderDetails(orderDetails);
		}
		orderMapper.updateOrder(orders);
	}
	
	public void deleteOrder(int id){
		orderDetailsMapper.deleteOrderDetails(id);
		orderMapper.deleteOrder(id);
	}

}
