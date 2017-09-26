package com.web.dao;

import com.web.entity.OrderDetails;

public interface OrderDetailsMapper {
	
	void deleteOrderDetails(int orderId);
	
	void insertOrderDetails(OrderDetails orderDetails);

}
