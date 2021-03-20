package ServletAction;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DAO.ProductDao;
import connection.model.Cart;
import connection.model.Items;
import connection.model.Product;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDao();
       
    public CartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			response.sendRedirect("LoginServlet");
		}
		else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String producttype = request.getParameter("producttype");
		String command = request.getParameter("command");
		String product = request.getParameter("product");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		try {
			int idProduct = Integer.parseInt(product);
			Product pro = productDao.getDetailProductById(idProduct);
			switch (command) {
			case "plus":
				if(cart.getCartItems().containsKey(idProduct)) {
					cart.plusToCart(idProduct, new Items(pro , cart.getCartItems().get(idProduct).getNumberProduct()));
				}
				else {
					cart.plusToCart(idProduct, new Items(pro , 1));
				}
				break;
			case "remove":
				cart.removeToCart(idProduct);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("cart", cart);
		if(request.getParameter("producttype")==null) {
			response.sendRedirect("products.jsp");
		}
		else {
			response.sendRedirect("products.jsp?producttype="+Integer.parseInt(producttype));
		}
	}
	
	

}
