package com.crimsonlogic.ASM.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crimsonlogic.ASM.dao.AssignmentDaoImpl;
import com.crimsonlogic.ASM.model.Assignment;

/**
 * Servlet implementation class UpdateStatusController
 */
@WebServlet("/updateStatusServlet")
public class UpdateStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AssignmentDaoImpl assignmentDAO;

    @Override
    public void init() {
        assignmentDAO = new AssignmentDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String assignmentId = request.getParameter("Id");
            Assignment existingAssignment2 = assignmentDAO.selectAssignment(assignmentId);
			    request.setAttribute("existingAssignment2", existingAssignment2);
			    request.getRequestDispatcher("Student/updateStatusForm.jsp").forward(request, response);
			
        } 
    }

