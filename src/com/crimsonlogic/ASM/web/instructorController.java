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

	
	import com.crimsonlogic.ASM.dao.CourseDaoImpl;
	import com.crimsonlogic.ASM.model.Course;

	/**
	 * Servlet implementation class InstructorController
	 * date :2nd september
	 */
	@WebServlet("/")
	public class instructorController extends HttpServlet{
	    private static final long serialVersionUID = 1L;
	    
	    private CourseDaoImpl courseDAO;
	    
	    public void init() {
	        courseDAO = new CourseDaoImpl();
	    }
	    
	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        doGet(req, resp);
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String action = req.getServletPath();
	        try {
	            switch (action) {
	            case "/new":
	                showNewForm(req, resp);
	                break;
	            case "/insert":
	                insertCourse(req, resp);
	                break;
	            case "/delete":
	                deleteCourse(req, resp);
	                break;
	            case "/edit":
	                showEditForm(req, resp);
	                break;
	            case "/update":
	                updateCourse(req, resp);
	                break;
	            case "/list": 
	            	listCourse(req,resp);
	            	break;
	            default:
					listCourse(req,resp);
					break;
				
					

	            }
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }

	    private void listCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	    	HttpSession session = req.getSession();
	    	int instructorid = Integer.parseInt(session.getAttribute("userid").toString());
	    	System.out.println(instructorid);
	    	int courseid = courseDAO.getCourseIdByInstructorId(instructorid);
	    	System.out.println(courseid); // Ensure this method is implemented correctly

	    	// Fetch the course list
	    	List<Course> courseList = courseDAO.selectAllCourses(instructorid);

	    	// Set attributes in the request
	    	
	    	req.setAttribute("courseList", courseList);
	    	session.setAttribute("courseid", courseid);
	    	System.out.println("next =====");
	    	System.out.println(req.getSession().getAttribute("courseid"));

	    	// Forward the request to the appropriate JSP page
	    	RequestDispatcher rd = req.getRequestDispatcher("Instructor/instructor.jsp");
	    	rd.forward(req, resp);

	    }

	    private void updateCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        String name = req.getParameter("name");
	        String description = req.getParameter("description");
	        int instructorId = Integer.parseInt(req.getParameter("userId")); // Retrieve instructorId from session
	       String instructorName= req.getParameter("userName");
	        Course updatedCourse = new Course(id, name, description, instructorId,instructorName);
	        courseDAO.updateCourse(updatedCourse);
	        resp.sendRedirect("list");
	    }

	    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        Course existingCourse = courseDAO.selectCourse(id);
	        RequestDispatcher rd = req.getRequestDispatcher("Instructor/course-form.jsp");
	        req.setAttribute("existingCourse", existingCourse);
	        rd.forward(req, resp);
	    }

	    private void deleteCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        courseDAO.deleteCourse(id);
	        resp.sendRedirect("list");
	    }

	    private void insertCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	    	String name = req.getParameter("name");
	        String description = req.getParameter("description"); 
	        int courseid= courseDAO.getCourseIdByUsername(name);
	        HttpSession session = req.getSession();
	        
	       session.setAttribute("courseid",courseid );
	        int instructorId =Integer.parseInt(req.getParameter("userId")); 
	        String instructorName =req.getParameter("userName"); 
	        Course newCourse = new Course(name, description, instructorId, instructorName);
	        courseDAO.insertCourse(newCourse);
	        resp.sendRedirect("list");
	    }

	    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
	        RequestDispatcher rd = req.getRequestDispatcher("Instructor/course-form.jsp");
	        rd.forward(req, resp);    
	    }
	    
	   
	}


