package com.crimsonlogic.ASM.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.ASM.model.Course;
import com.crimsonlogic.ASM.utils.JDBCUtils;



/**
 * This DAO class provides CRUD database operations for the course table in the DB
 * @version 1.0
 */
public class CourseDaoImpl   {

    private static final String INSERT_COURSE_SQL = "INSERT INTO course (course_name, course_description, instructor_id, instructorname) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_COURSES = "SELECT * FROM course where instructor_id=?";
    private static final String SELECT_COURSE_BY_ID = "SELECT * FROM course WHERE course_id = ?";
    private static final String DELETE_COURSE_BY_ID = "DELETE FROM course WHERE course_id = ?";
    private static final String UPDATE_COURSE = "UPDATE course SET course_name = ?, course_description = ?, instructor_id = ?, instructorname = ? WHERE course_id = ?";
   
   
    public void insertCourse(Course course) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(INSERT_COURSE_SQL);
            pstmt.setString(1, course.getCourseName());
            pstmt.setString(2, course.getCourseDescription());
            pstmt.setInt(3, course.getInstructorId());
            pstmt.setString(4, course.getInstructorName());
            pstmt.executeUpdate();
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        } finally {
        	try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
    }

   
    public Course selectCourse(int courseId) {
        Course course = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(SELECT_COURSE_BY_ID);
            pstmt.setInt(1, courseId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("course_id");
                String name = rs.getString("course_name");
                String description = rs.getString("course_description");
                int instructorId = rs.getInt("instructor_id");
                String instructorName = rs.getString("instructorname");
                course = new Course(id, name, description, instructorId, instructorName);
            }
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        } finally {
        	try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return course;
    }

    
    public List<Course> selectAllCourses(int instructor_id) {
        List<Course> courseList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_COURSES);
            pstmt.setInt(1, instructor_id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("course_id");
                String name = rs.getString("course_name");
                String description = rs.getString("course_description");
                int instructorId = rs.getInt("instructor_id");
                String instructorName = rs.getString("instructorname");
                courseList.add(new Course(id, name, description, instructorId, instructorName));
            }
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        } finally {
        	try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return courseList;
    }

    
    public boolean deleteCourse(int courseId) throws SQLException {
        boolean rowDeleted = false;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(DELETE_COURSE_BY_ID);
            pstmt.setInt(1, courseId);
            rowDeleted = pstmt.executeUpdate() > 0;
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        } finally {
        	try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return rowDeleted;
    }

   
    public boolean updateCourse(Course course) throws SQLException {
        boolean rowUpdated = false;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(UPDATE_COURSE);
            pstmt.setString(1, course.getCourseName());
            pstmt.setString(2, course.getCourseDescription());
            pstmt.setInt(3, course.getInstructorId());
            pstmt.setString(4, course.getInstructorName());
            pstmt.setInt(5, course.getCourseId());
            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        } finally {
        	try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return rowUpdated;
    }
	   public int getCourseIdByUsername(String coursename) {
	        String SELECT_COURSE_ID_SQL = "SELECT course_id FROM course WHERE course_name = ?;";
	        
	        int courseId = 0;
	        try (Connection connection = JDBCUtils.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COURSE_ID_SQL)) {
	            preparedStatement.setString(1, coursename);
	           

	            // Log the PreparedStatement for debugging
	            System.out.println(preparedStatement);

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    courseId = resultSet.getInt("course_id");
	                }
	            }
	        } catch (SQLException e) {
	            // Process SQL exception
	            JDBCUtils.printSQLException(e);
	        }
	        System.out.println();
	        return courseId;
	    }
	   
	   public int getCourseIdByInstructorId( int instructor_id)
	   {
		   String SELECT_COURSE_ID_SQL = "SELECT course_id FROM course WHERE instructor_id = ?;";
       
       int courseId = 0;
       try (Connection connection = JDBCUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COURSE_ID_SQL)) {
           preparedStatement.setInt(1,instructor_id );
          

           // Log the PreparedStatement for debugging
           System.out.println(preparedStatement);

           try (ResultSet resultSet = preparedStatement.executeQuery()) {
               if (resultSet.next()) {
                   courseId = resultSet.getInt("course_id");
               }
           }
       } catch (SQLException e) {
           // Process SQL exception
           JDBCUtils.printSQLException(e);
       }
       System.out.println();
       return courseId;
		   
	   }
}

