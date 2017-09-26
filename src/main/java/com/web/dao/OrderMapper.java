package com.web.dao;

import java.util.List;

import com.web.entity.Orders;

public interface OrderMapper {
	
	List<Orders> getOrdersByPage(int count1,int count2);
	
	Orders getOneOrder(int id);
	
	void updateOrder(Orders orders);
	
	void addOrder(Orders orders);
	
	void deleteOrder(int id);
	
	int getTotalcount();
	
	List<Orders> getOrdersList();

}
