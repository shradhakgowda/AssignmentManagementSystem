package com.crimsonlogic.ASM.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.ASM.model.Assignment;
import com.crimsonlogic.ASM.utils.JDBCUtils;

public class StudentDao {
	

        public List<Assignment> selectAllAssignmentsByStudentId(int student_id) {
        	System.out.println(student_id);
            List<Assignment> assignList = new ArrayList<>();
            Connection conn = null;
            PreparedStatement pstmt = null;
            String query="Select * from assignment where assignstudentid=?;";
            try {
                conn = JDBCUtils.getConnection();
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, student_id);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
    	            String id = rs.getString("assignmentId");
    	            String name = rs.getString("assignmentName");
    	            int courseId = rs.getInt("assignCourseId");
    	            int instructorId = rs.getInt("assigInstructorId");
    	            String status = rs.getString("assignStatus");
    	            int studentId = rs.getInt("assignStudentId");
    	            String studentName = rs.getString("assignStudentName");
    	            String dueDate = rs.getString("assigndueDate");
    	            String remarks = rs.getString("remarks");
    	            assignList.add( new Assignment(id, name, courseId, instructorId, status, studentId, studentName,dueDate, remarks)); 
    	            System.out.println(assignList.toString());
    	            }
            } catch (SQLException exception) {
                JDBCUtils.printSQLException(exception);
            } finally {
            	try {
    				conn.close();
    				pstmt.close();
    			} catch (SQLException e) {
    				System.out.println(e.getMessage());
    			}
            }
            return assignList;
        }
        
    	
    }

