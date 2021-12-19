package com.company.exchange.service.impl;

import com.company.exchange.pojo.PageInfo;
import com.github.pagehelper.PageHelper;
import com.company.exchange.dao.OrdersMapper;
import com.company.exchange.pojo.Orders;
import com.company.exchange.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {
	
	@Resource
	private OrdersMapper ordersMapper;

	public List<Orders> getOrdersByUserId(Integer user_id) {
		// TODO Auto-generated method stub
		List<Orders> orders=ordersMapper.selectOrdersByUserId(user_id);
		return orders;
	}

	@Override
	public PageInfo<Orders> getSellerPageOrdersByUserId(Integer user_id, Integer currentPage, Integer pageNum) {
		int start=(currentPage-1)*pageNum;

		List<Orders> orders=ordersMapper.selectSellerOrdersByUserAndGoods(user_id,start,pageNum);

		int total=ordersMapper.sellCount(user_id);

		PageInfo<Orders> pageInfo=new PageInfo<>();

		pageInfo.setData(orders);
		pageInfo.setTotal(total);
		pageInfo.setCurrentPage(currentPage);

		return pageInfo;
	}

	@Override
	public PageInfo<Orders> getPageOrdersByUserId(Integer user_id,Integer currentPage, Integer pageNum) {

		int start=(currentPage-1)*pageNum;

		List<Orders> orders=ordersMapper.selectPageOrdersByUserId(user_id,start,pageNum);

		int total=ordersMapper.count(user_id);

		PageInfo<Orders> pageInfo=new PageInfo<>();
		pageInfo.setData(orders);
		pageInfo.setTotal(total);
		pageInfo.setCurrentPage(currentPage);

		return pageInfo;

	}

	@Override
	public List<Orders> getOrdersByUserAndGoods(Integer user_id) {
		// TODO Auto-generated method stub
		
		List<Orders> ordersOfSell=ordersMapper.selectOrdersByUserAndGoods(user_id);
		return ordersOfSell;
	}

	@Override
	public void addOrders(Orders orders) {
		// TODO Auto-generated method stub
		
		ordersMapper.addOrders(orders);
		
	}

	@Override
	public void deliverByOrderNum(Integer orderNum) {
		// TODO Auto-generated method stub
		ordersMapper.deliverByOrderNum(orderNum);
	}

	@Override
	public void receiptByOrderNum(Integer orderNum) {
		// TODO Auto-generated method stub
		ordersMapper.receiptByOrderNum(orderNum);
		
	}

	@Override
	public int getOrdersNum() {
		List<Orders> orders = ordersMapper.getOrdersList();
	    return orders.size();
	}

	@Override
	public List<Orders> getPageOrders(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Orders> list =ordersMapper.getOrdersList();
		return list;
	}

	@Override
	public Orders getOrdersById(int ordersId) {
		Orders orders = ordersMapper.selectById(ordersId);
	        return orders;
	}

	@Override
	public void updateByPrimaryKey(Integer id, Orders orders) {
			orders.setId(id);
	        this.ordersMapper.updateByPrimaryKey(orders);
		
	}

	@Override
	public void deleteOrdersByPrimaryKeys(int id) {
		 ordersMapper.deleteByPrimaryKeys(id);
	}

	@Override
	public List<Orders> getPageOrdersByOrders(Long orderNum, String orderInformation, Integer orderState, int pageNum,
			int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Orders> orders = ordersMapper.getPageOrdersByOrders(orderNum,orderInformation,orderState);
		return orders;
	}

}
