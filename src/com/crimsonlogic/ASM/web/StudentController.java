package com.crimsonlogic.ASM.web;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.ASM.dao.StudentDao;
import com.crimsonlogic.ASM.model.Assignment;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private StudentDao studentDao;
  
	public void init() {

			studentDao = new StudentDao();
		} 
    public StudentController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		System.out.println("execute method");
		HttpSession session = request.getSession();
		int stdid=Integer.parseInt(session.getAttribute("studentuserid").toString());
		List<Assignment>assignmentList1=studentDao.selectAllAssignmentsByStudentId(stdid);
		System.out.println(assignmentList1);
		System.out.println("inside list");
		session.setAttribute("assignmentList1", assignmentList1);
		request.getRequestDispatcher("/Student/student.jsp").forward(request, response);
		 //request.getRequestDispatcher("/Student/student.jsp").forward(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("execute method");
		HttpSession session = request.getSession();
		int stdid=Integer.parseInt(session.getAttribute("studentuserid").toString());
		List<Assignment>assignmentList1=studentDao.selectAllAssignmentsByStudentId(stdid);
		System.out.println("inside list");
		request.setAttribute("assignmentList1", assignmentList1);
		 request.getRequestDispatcher("/Student/student.jsp").forward(request, response);	
		}

		
	
	
	
}

