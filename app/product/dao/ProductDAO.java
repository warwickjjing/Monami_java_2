package com.monami.app.product.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.monami.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSession sqlsession;

	public ProductDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public int getProductCnt(String keyword) {
		int result = 0;
		if (keyword != null || keyword != "") {
			result = sqlsession.selectOne("Product.getSearchCnt", keyword);
		} else {
			result = sqlsession.selectOne("Product.getProductCnt");
		}
		return result;
	}

	public List<ProductDTO> getProductList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<ProductDTO> result;
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		if (keyword == null) {
			result = sqlsession.selectList("Product.getProductList", datas);
		} else {
			datas.put("keyword", keyword);
			result = sqlsession.selectList("Product.getProductListWithKey", datas);
		}
		return result;
	}

	public ProductDTO getBasket(int prod_idx) {
		return sqlsession.selectOne("Product.getBasket", prod_idx);
	}

	public boolean updateCount(int prod_cnt, int prod_idx) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("prod_count", prod_cnt);
		datas.put("prod_idx", prod_idx);

		return 1 == sqlsession.update("Product.updateCount", datas);
	}

	public ProductDTO getDetail(int prod_idx) {
		return sqlsession.selectOne("Product.getDetail", prod_idx);
	}
}