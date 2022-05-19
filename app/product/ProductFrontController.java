package com.monami.app.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.ActionTo;

public class ProductFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionTo transfer = new ActionTo();

		switch (command) {
			case "/product/ProductList.pd":
				try {
					transfer = new ProductListAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("ProductList : " + e);
				}
				break;
			case "/product/ProductDetailView.pd":
				try {
					transfer = new ProductDetailViewtAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("ProductDetailViewtOk : " + e);
				}
				break;
			case "/product/Basket.pd":
				try {
					transfer = new BasketAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("BasketOk : " + e);
				}
				break;
			case "/product/BasketList.pd":
				try {
					transfer = new BasketListAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("BasketOk : " + e);
				}
				break;
			case "/product/BasketOK.pd":
				try {
					transfer = new BasketOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("BasketOk : " + e);
				}
				break;
			case "/product/BasketCancelOk.pd":
				try {
					transfer = new BasketCancelOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("BasketCancelOk : " + e);
				}
				break;
			case "/product/Order.pd":
				transfer = new ActionTo();
				transfer.setPath("/app/geunseok/order.jsp");
				transfer.setRedirect(false);
				break;
			case "/user/OrderOk.pd":
				try {
					transfer = new OrderOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("OrderOk : " + e);
				}
				break;
		}

		if (transfer != null) {
			if (transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
			}
		}
	}
}