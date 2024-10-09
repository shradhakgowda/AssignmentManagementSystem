package com.crimsonlogic.ASM.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.ASM.dao.AssignmentDaoImpl;
import com.crimsonlogic.ASM.model.Assignment;

/**
 * Servlet implementation class AssignmentInsertController
 */
@WebServlet("/AssignmentInsertController")
public class AssignmentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	private AssignmentDaoImpl assignmentDAO;

	@Override
	public void init() {
		assignmentDAO = new AssignmentDaoImpl();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			insertAssignment(request,response);
			HttpSession session = request.getSession();
			int courseid = Integer.parseInt(session.getAttribute("courseid").toString());
			System.out.println(courseid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private void insertAssignment(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException, SQLException {
	    // Generate a new assignment ID
	    String id = generateAssignmentId();

	    // Retrieve hidden fields from the form
	    HttpSession session = req.getSession();
	    
	    int courseId = Integer.parseInt(session.getAttribute("courseid").toString());
	    System.out.println("checking");
	    System.out.println(courseId);
	    int instructorId = Integer.parseInt(req.getParameter("assignInstructorId"));

	    // Retrieve other fields from the form
	    String name = req.getParameter("assignName"); // Assignment name
	    String status = req.getParameter("assignStatus"); // Status of the assignment
	    int studentId = Integer.parseInt(req.getParameter("assignStudentId")); // Student ID
	    String studentName = req.getParameter("assignStudentName"); // Student Name
	    String dueDate = req.getParameter("assignDueDate"); // Due Date
	    String remarks = req.getParameter("assignRemarks"); // Remarks

	    // Create a new Assignment object
	    Assignment newAssignment = new Assignment(id, name, courseId, instructorId, status, studentId, studentName, dueDate, remarks);

	    // Insert the new assignment into the database
	    assignmentDAO.insertAssignment(newAssignment);

	    // Redirect to the assignment list
	    resp.sendRedirect(req.getContextPath() + "/Assignment/assignmentlist");
	}
	public String generateAssignmentId() {
		String userId = "ASS" + Math.round(Math.random() * 900000 + 100000);
		return userId;
	}


}
