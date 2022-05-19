package com.monami.app.product.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class OrderDAO{
	SqlSession sqlsession;

	public OrderDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public boolean insertOrder(OrderDTO order) {
		return 1 == sqlsession.insert("Order.insertOrder",order);
	}
}
