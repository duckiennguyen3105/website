package AdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DAO.CompanyDAO;
import connection.model.Company;

@WebServlet("/ManageCompany")
public class ManageCompany extends HttpServlet {
	private final CompanyDAO companyDao = new CompanyDAO(); 
	private static final long serialVersionUID = 1L;
	public ManageCompany() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String IdCompany = request.getParameter("IdCompany");
		String command = request.getParameter("command");
		

		try {
			switch (command) {
			case "remove":
				companyDao.DeteleCompany(Integer.parseInt(IdCompany));
				break;
			}
			response.sendRedirect("admin/CompanyTable.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idCompany = request.getParameter("idCompany");
		String command =  request.getParameter("command");
		String NameCompany = request.getParameter("NameCompany");
		try {
			if (NameCompany.equals("")) {
				request.setAttribute("error", "Vui lòng nhập công ty");
				response.sendRedirect("admin/InsertCompany.jsp");
			} else {
				switch (command) {
				case "insert":
					companyDao.InsertCompany(new Company(NameCompany));
					break;
				case "update":
					companyDao.UpdateCompany(new Company(Integer.parseInt(idCompany), NameCompany));
					break;

				}
				response.sendRedirect("admin/CompanyTable.jsp");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
