package com.crimsonlogic.ASM.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.ASM.dao.AssignmentDaoImpl;
import com.crimsonlogic.ASM.model.Assignment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Assignment")
public class AssignmentController extends HttpServlet {
    private AssignmentDaoImpl assignmentDAO;

    @Override
    public void init() {
        assignmentDAO = new AssignmentDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            switch (action) {
                case "/assignmentnew":
                    showNewForm(req, resp);
                    break;
                case "/insertAssignment":
                    insertAssignment(req, resp);
                    break;
                case "/assignmentdelete":
                    deleteAssignment(req, resp);
                    break;
                case "/assignmentedit":
                    showEditForm(req, resp);
                    break;
                case "/assignmentupdate":
                    updateAssignment(req, resp);
                    break;
                case "/assignmentlist":
                    listAssignments(req, resp);
                    break;
                default:
                    listAssignments(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("Assignment/Assignment-form.jsp").forward(req, resp);
    }

    private void insertAssignment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
    	 String id=generateAssignmentId(); 
        String name = req.getParameter("assignName");
        int courseId = Integer.parseInt(req.getParameter("assignCourseId"));
        int instructorId = Integer.parseInt(req.getParameter("assignInstructorId"));
        String status = req.getParameter("assignStatus");
        int studentId = Integer.parseInt(req.getParameter("assignStudentId"));
        String studentName = req.getParameter("assignStudentName");
        String dueDate = req.getParameter("assignDueDate");
        String remarks = req.getParameter("assignRemarks");

        Assignment newAssignment = new Assignment(id,name, courseId, instructorId, status, studentId, studentName, dueDate, remarks);
        assignmentDAO.insertAssignment(newAssignment);
        resp.sendRedirect("Assignment?action=/assignmentlist");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
    	
    	String id = req.getParameter("id");
        Assignment existingAssignment = assignmentDAO.selectAssignment(id);
        req.setAttribute("existingAssignment", existingAssignment);
        req.getRequestDispatcher("Assignment/Assignment-form.jsp").forward(req, resp);
    }

    private void updateAssignment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
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
        resp.sendRedirect("Assignment?action=/assignmentlist");
    }

    private void deleteAssignment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
    	String id = req.getParameter("id");
        assignmentDAO.deleteAssignment(id);
        resp.sendRedirect("Assignment?action=/assignmentlist");
    }

    private void listAssignments(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
    	HttpSession session = req.getSession();
		int courseId = (int) session.getAttribute("courseid");
		System.out.println("inside list");
		List<Assignment> assignmentList = assignmentDAO.selectAllAssignments(courseId);
		req.setAttribute("assignmentList", assignmentList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("Assignment/Assignment-list.jsp");
		dispatcher.forward(req, resp);
    }
    public String generateAssignmentId() {
		String userId = "ASS" + Math.round(Math.random() * 900000 + 100000);
		return userId;
	}
}
