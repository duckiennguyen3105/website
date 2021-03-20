package ServletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DAO.UserDAO;

@WebServlet("/CheckUserServlet")
public class CheckUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDAO user = new UserDAO();
    public CheckUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		try {
			if (user.CheckUser(request.getParameter("username"))) {
			      response.getWriter().write("<p><img style=\"width:1%\" src=\"resources/img/not-available.png\" /> Tài khoản đã tồn tại</p>");
			  
			 } 
			else if(user.CheckUser(request.getParameter(""))){
				response.getWriter().write("<p><img style=\"width:1%\" src=\"resources/img/not-available.png\" /> Thông tin được yêu cầu</p>");
			}
			else {
			      response.getWriter().write("<p><img style=\"width:1%\" src=\"resources/img/available.png\" /> Tài khoản hợp lệ</p>");
	
			 }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
