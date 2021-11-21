package com.company.exchange.dao;

import com.company.exchange.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {

	public List<Orders> selectOrdersByUserId(Integer user_id);
	

	
	public List<Orders> selectOrdersByUserAndGoods(Integer user_id);
	


	public void addOrders(Orders orders);


	public void deliverByOrderNum(Integer orderNum);


	public void receiptByOrderNum(Integer orderNum);
	


	public List<Orders> getOrdersList();
	

	public Orders selectById(int id);

	public void updateByPrimaryKey(Orders orders);

	public void deleteByPrimaryKeys(int id);

	public List<Orders> getPageOrdersByOrders(@Param("orderNum") Long orderNum, @Param("orderInformation") String orderInformation, @Param("orderState") Integer orderState);

}
