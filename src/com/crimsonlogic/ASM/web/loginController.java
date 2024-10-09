package com.crimsonlogic.ASM.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.ASM.dao.LoginDao;
import com.crimsonlogic.ASM.dao.UserDao;
import com.crimsonlogic.ASM.model.LoginBean;
import com.crimsonlogic.exceptions.InvalidUserNameAndIdException;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/login")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;
	private UserDao userDao;

	public void init() {
		loginDao = new LoginDao();
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		authenticate(request, response);
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		LoginBean loginBean = new LoginBean();

		loginBean.setUserName(username);
		loginBean.setUserPassword(password);
		loginBean.setUserRole(role);
		System.out.println(role);
		try {
			if (loginDao.validate(loginBean) && role.equals("student")) {
				int userId = userDao.getUserIdByUsername(username);
				HttpSession session = request.getSession();
				session.setAttribute("studentusername", username);
				session.setAttribute("studentuserid", userId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentController");
				dispatcher.forward(request, response);

			} else if (loginDao.validate(loginBean) && role.equals("instructor")) {
				int userId = (int)userDao.getUserIdByUsername(username);
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("userid", userId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Instructor/instructor.jsp");
				dispatcher.forward(request, response);
			} else {
				throw new InvalidUserNameAndIdException("connection not established");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
