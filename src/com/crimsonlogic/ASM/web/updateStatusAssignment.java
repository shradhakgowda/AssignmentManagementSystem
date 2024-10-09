package com.crimsonlogic.ASM.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.ASM.dao.AssignmentDaoImpl;
import com.crimsonlogic.ASM.model.Assignment;

/**
 * Servlet implementation class updateStatusAssignment
 */
@WebServlet("/updateStatusAssignment")
public class updateStatusAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private AssignmentDaoImpl assignmentDAO;
	  @Override
	    public void init() {
	        assignmentDAO = new AssignmentDaoImpl();
	    }

//	  @Override
//	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	        String action = req.getParameter("action");
//	        try {
//				updateAssignment(req,resp);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//	}
	  @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       
	        
				try {
					updateAssignment(req,resp);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        
			

	}
	  
	  
	    private void updateAssignment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
	        String id = req.getParameter("assignmentId");
	        String name = req.getParameter("assignName");
	        int courseId = Integer.parseInt(req.getParameter("assignCourseId"));
	        int instructorId = Integer.parseInt(req.getParameter("assignInstructorId"));
	        String status = req.getParameter("assignStatus");
	        int studentId = Integer.parseInt(req.getParameter("assignStudentId"));
	        String studentName = req.getParameter("assignStudentName");
	        String dueDate = req.getParameter("assignDueDate");
	        String remarks = req.getParameter("assignRemarks");

	        Assignment assignment = new Assignment(id, name, courseId, instructorId, status, studentId, studentName, dueDate, remarks);
	        assignmentDAO.updateAssignment(assignment);
	        
	        req.getRequestDispatcher("StudentController").forward(req, resp);
	    }

}
