package ServletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import connection.DAO.UserDAO;
import connection.model.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	UserDAO userDao = new UserDAO();

	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			session.removeAttribute("user");
			session.removeAttribute("cart");
			response.sendRedirect("homepage.jsp");



		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="";
		User user = new User();
		HttpSession session = request.getSession();
			user.setName(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setPhone(Integer.parseInt(request.getParameter("phone")));
			user.setAddress(request.getParameter("address"));
			try {
				userDao.insertUser(user);
				session.setAttribute("user", user);
				url= "/homepage.jsp";
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);


	}

}
