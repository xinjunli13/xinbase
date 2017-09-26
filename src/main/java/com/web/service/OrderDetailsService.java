package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.OrderDetailsMapper;
import com.web.entity.OrderDetails;

@Service
public class OrderDetailsService {

	@Autowired
	private OrderDetailsMapper orderDetailsMapper;
	
	public void deleteOrderDetails(int orderId){
		orderDetailsMapper.deleteOrderDetails(orderId);
	}
	
	public void insertOrderDetails(OrderDetails orderDetails){
		orderDetailsMapper.insertOrderDetails(orderDetails);
	}
}
