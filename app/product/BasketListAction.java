package com.monami.app.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.ActionTo;
import com.monami.app.product.dao.ProductDAO;
import com.monami.app.product.dao.ProductDTO;

public class BasketListAction implements Action {

    @SuppressWarnings("null")
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ProductDAO pdao = new ProductDAO();
        String cookie = req.getHeader("Cookie");
        String basket = "";

        if (cookie != null) {
            Cookie[] cookies = req.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("basket")) {
                    basket = cookies[i].getValue();
                }
            }
        }
        String[] list = basket.split("/");
        ProductDTO product = new ProductDTO();
        ArrayList<ProductDTO> basketlist = new ArrayList<ProductDTO>();
        if (list != null) {
            for (int i = 0; i < list.length; i++) {
                String[] idx = list[i].split(":");
                System.out.println("쿠키 인덱스 :" + idx[0]);
                int prod_idx = Integer.parseInt(idx[0]);
                int count = Integer.parseInt(idx[1]);
                product = pdao.getBasket(prod_idx);
                System.out.println("상품DTO :" + product);
                basketlist.add(product);
            }
        }
        ActionTo transfer = new ActionTo();
        req.setAttribute("basketlist", basketlist);
        System.out.println("배스켓리스트 :" + basketlist);

        transfer.setRedirect(false);
        transfer.setPath("/geunseok/basket.jsp");
        return transfer;
 
    }

}