package ServletAction;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DAO.OrderDetailDAO;
import connection.DAO.ProductDao;
import connection.DAO.orderDAO;
import connection.model.Cart;
import connection.model.Items;
import connection.model.Order;
import connection.model.OrderDetail;
import connection.model.User;

@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private orderDAO orderDao = new orderDAO();
	private OrderDetailDAO detailDao = new OrderDetailDAO();
	public PayServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart.countItems() == 0) {
			session.setAttribute("alert","Vui lòng thêm sản phẩm");
			response.sendRedirect("products.jsp");
		}
		else {
		doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String payment = request.getParameter("payment"); 
		HttpSession session = request.getSession(); 
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		try {
			int ID = (int) new Date().getTime();
			Order order = new Order();
			order.setIdOrder(ID);
			order.setAddUser(user.getAddress());
			order.setPayment(payment);
			order.setPhoneUser(user.getPhone());
			order.setUser_idUser(user.getIdUser());
			order.setStartDate(new Timestamp(new Date().getTime()));
			order.setTotal(cart.sumTotal());
			orderDao.insertOrder(order);
			for (Map.Entry<Integer, Items> list : cart.getCartItems().entrySet()) {
				detailDao.insertOrderDetail(new OrderDetail(list.getValue().getNumberProduct() ,ID , list.getValue().getProduct().getIdProduct() ,list.getValue().getProduct().getPrice() ));
			}
			cart = new Cart();
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("alert", "Đơn hàng của bạn đã được ghi nhận");
		response.sendRedirect("homepage.jsp");
	}

}
