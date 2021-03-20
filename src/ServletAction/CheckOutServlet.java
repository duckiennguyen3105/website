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

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private ProductDao productDao = new ProductDao();
	private static final long serialVersionUID = 1L;
       
    public CheckOutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String product = request.getParameter("product");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		try {
			int idProduct = Integer.parseInt(product);
			Product pro = productDao.getDetailProductById(idProduct);
			switch (command) {
			case "plus":
				cart.plusToCart(idProduct, new Items(pro , cart.getCartItems().get(idProduct).getNumberProduct()));
				break;
				
			case "minus":
				cart.minusToCart(idProduct, new Items(pro, cart.getCartItems().get(idProduct).getNumberProduct()));
				break;
			case "remove":
				cart.removeToCart(idProduct);
				break;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("cart", cart);
		response.sendRedirect("CheckOut.jsp");
	}

}
