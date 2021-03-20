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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	UserDAO userDao = new UserDAO();
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="";
		User user = new User();
		HttpSession session = request.getSession();
		try {
			user = userDao.loginUser(request.getParameter("username"), request.getParameter("password"));
			if(user != null) {
				session.setAttribute("user", user);
				url="/homepage.jsp";
			}
			else {
				request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
				url="/Login.jsp";

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
