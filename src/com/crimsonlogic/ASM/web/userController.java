package com.crimsonlogic.ASM.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.ASM.dao.UserDao;
import com.crimsonlogic.ASM.model.Users;


/**
 * Servlet implementation class userController
 */
@WebServlet("/register")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	
	
	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		register(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("Register/register.jsp");
	}
	
	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userName = request.getParameter("username");
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		String userRole= request.getParameter("role");

		Users user = new Users();
		user.setUserName(userName);
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		user.setUserRole(userRole);

		try {
			int result = userDao.registerUser(user);
			if(result == 1) {
				request.setAttribute("NOTIFICATION", "User Registered Successfully!  to login page");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
		dispatcher.forward(request, response);
	}
}
