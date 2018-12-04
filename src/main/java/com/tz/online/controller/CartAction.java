package com.tz.online.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tz.online.book.service.IBookService;
import com.tz.online.cart.service.IShoppingCart;
import com.tz.online.entity.Book;
import com.tz.online.entity.OrderItem;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/cart/*")
public class CartAction extends HttpServlet {

	private static final long serialVersionUID = 4820318102273744917L;

	/** 业务接口 */
	private IBookService bookService;
	/** 请求URL资源常量 */
	private static final String _SHOPPING = "/addCartAjax";// 添加到购物车
	private static final String _TO_SHOPPINGCART = "/showcart";// 查看购物车
	private static final String _MODIFYCART = "/modifyCartAjax";// 修改商品数量
	private static final String _REMOVE_CART = "/removeCartAjax";// 删除商品
	private static final String _CLEAR_CART = "/clearCartAjax";// 清空购物车

	public CartAction() {
		super();
		this.bookService = (IBookService) BeanFactory.getInstance("bookService");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		HttpSession ses = req.getSession();
		switch (req.getPathInfo()) {
		case _SHOPPING:
			Long id = Long.valueOf(req.getParameter("id"));
			Long num = Long.valueOf(req.getParameter("num"));
			Book b = bookService.query(id);
			OrderItem oi = new OrderItem(b.getIsbn(), b.getName(), b.getAuthor(), num, b.getNewPrice() * num,
					b.getNewPrice());
			IShoppingCart cart = (IShoppingCart) ses.getAttribute("cart");
			if (cart == null) {
				cart = (IShoppingCart) BeanFactory.getInstance("cartService");
			}
			cart.addCart(id, oi);
			ses.setAttribute("cart", cart);
			out.printf(cart.getCount() + ":%.2f", cart.getTotal());

			break;
		case _TO_SHOPPINGCART:
			IShoppingCart cart1 = (IShoppingCart) ses.getAttribute("cart");
			Map<Book, OrderItem> map2 = new HashMap<>();
			if (cart1!=null) {
				Map<Long, OrderItem> map = cart1.getItems();
				Set<Long> set = map.keySet();
				for (Long l : set) {
					map2.put(bookService.query(l), map.get(l));
				}
			}
			req.setAttribute("bookAndItem", map2);
			req.getRequestDispatcher("/jsp/cart.jsp").forward(req, resp);
			break;
		case _MODIFYCART:
			Long bookid1=Long.valueOf(req.getParameter("bookid1"));
			Long count=Long.valueOf(req.getParameter("newnum"));
			IShoppingCart cart3 = (IShoppingCart) ses.getAttribute("cart");
			if (cart3!=null) {
				cart3.modifyCount(bookid1, count);
			}
			ses.setAttribute("cart", cart3);
			out.printf(cart3.getCount()+":%.2f:%.2f",cart3.getTotal(),cart3.getItems().get(bookid1).getAllPrice());

			break;
		case _REMOVE_CART:
			String[] ids=req.getParameter("ids").split(":");
			IShoppingCart cart4 = (IShoppingCart) ses.getAttribute("cart");
			if (cart4!=null) {			
				for (String i : ids) {
					cart4.delete(Long.valueOf(i));
				}
			}
			ses.setAttribute("cart", cart4);
			out.printf(cart4.getCount()+":%.2f",cart4.getTotal());
			break;
		case _CLEAR_CART:

			break;

		default:
			break;
		}

	}
}
