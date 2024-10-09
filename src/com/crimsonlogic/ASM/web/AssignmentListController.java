package com.crimsonlogic.ASM.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.ASM.dao.AssignmentDaoImpl;
import com.crimsonlogic.ASM.model.Assignment;

/**
 * Servlet implementation class AssignmentListController
 */
@WebServlet("/AssignmentListController")
public class AssignmentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private AssignmentDaoImpl assignmentDAO;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	@Override
	public void init() {
		assignmentDAO = new AssignmentDaoImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			listAssignments(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	private void listAssignments(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException {
		try {
		HttpSession session = req.getSession();
		int courseId = Integer.parseInt(session.getAttribute("courseid").toString());
		System.out.println("inside list");
		List<Assignment> assignmentList = assignmentDAO.selectAllAssignments(courseId);
		req.setAttribute("assignmentList", assignmentList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("Assignment/Assignment-list.jsp");
		dispatcher.forward(req, resp);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}

}
