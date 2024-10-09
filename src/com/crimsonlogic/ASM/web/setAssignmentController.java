package com.crimsonlogic.ASM.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/setAssignment")
public class setAssignmentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String assignmentId = request.getParameter("assignmentId");
            request.getSession().setAttribute("selectedAssignmentId", assignmentId);

            response.sendRedirect("updateStatusForm.jsp");
        }
    }




