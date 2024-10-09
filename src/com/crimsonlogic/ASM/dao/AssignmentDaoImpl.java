package com.crimsonlogic.ASM.dao;



import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.ASM.model.Assignment;
import com.crimsonlogic.ASM.utils.JDBCUtils;

/**
 * This DAO class provides CRUD database operations for the assignment table in the DB
 * @version 1.0
 */
public class AssignmentDaoImpl  {

	private static final String INSERT_ASSIGNMENT_SQL = "INSERT INTO assignment(assignmentId,assignmentName, assignCourseId, assigInstructorId, assignStatus, assignStudentId, assignStudentName, assignduedate, remarks) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_ALL_ASSIGNMENTS = "SELECT * FROM assignment WHERE assignCourseId=?";
	private static final String SELECT_ASSIGNMENT_BY_ID = "SELECT * FROM assignment WHERE assignmentId = ?";
	private static final String DELETE_ASSIGNMENT_BY_ID = "DELETE FROM assignment WHERE assignmentId = ?";
	private static final String UPDATE_ASSIGNMENT = "UPDATE assignment SET assignmentName = ?, assignCourseId = ?, assigInstructorId = ?, assignStatus = ?, assignStudentId = ?, assignStudentName = ?, assigndueDate = ?, remarks = ? WHERE assignmentId = ?";

	public void insertAssignment(Assignment assignment) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = JDBCUtils.getConnection();
	        pstmt = conn.prepareStatement(INSERT_ASSIGNMENT_SQL);
	        
	        pstmt.setString(1, assignment.getAssignmentId());
	        pstmt.setString(2, assignment.getAssignmentName());
	        pstmt.setInt(3, assignment.getAssignCourseId());
	        pstmt.setInt(4, assignment.getAssigInstructorId());
	        pstmt.setString(5, assignment.getAssignStatus());
	        pstmt.setInt(6, assignment.getAssignStudentId());
	        pstmt.setString(7, assignment.getAssignStudentName());
	        pstmt.setString(8, assignment.getAssigndueDate().toString());
	        pstmt.setString(9, assignment.getAssignRemarks());
	        pstmt.executeUpdate();
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
   
	public Assignment selectAssignment(String assignmentId) {
	    Assignment assignment = null;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = JDBCUtils.getConnection();
	        pstmt = conn.prepareStatement(SELECT_ASSIGNMENT_BY_ID);
	        pstmt.setString(1, assignmentId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            String id = rs.getString("assignmentId");
	            String name = rs.getString("assignmentName");
	            int courseId = rs.getInt("assignCourseId");
	            int instructorId = rs.getInt("assigInstructorId");
	            String status = rs.getString("assignStatus");
	            int studentId = rs.getInt("assignStudentId");
	            String studentName = rs.getString("assignStudentName");
	            String dueDate = rs.getString("assigndueDate");
	            String remarks = rs.getString("remarks");
	            assignment = new Assignment(id, name, courseId, instructorId, status, studentId, studentName,dueDate, remarks);
	        }
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return assignment;
	}

public List<Assignment> selectAllAssignments(int courseId) {
    List<Assignment> assignmentList = new ArrayList<>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = JDBCUtils.getConnection();
        pstmt = conn.prepareStatement(SELECT_ALL_ASSIGNMENTS);
        pstmt.setInt(1, courseId);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            String id = rs.getString("assignmentId");
            String name = rs.getString("assignmentName");
            int assignCourseId = rs.getInt("assignCourseId");
            int assigInstructorId = rs.getInt("assigInstructorId");
            String status = rs.getString("assignStatus");
            int studentId = rs.getInt("assignStudentId");
            String studentName = rs.getString("assignStudentName");
            String assigndueDate = rs.getString("assigndueDate");
            String remarks = rs.getString("remarks");
            assignmentList.add(new Assignment(id, name, assignCourseId, assigInstructorId, status, studentId, studentName, assigndueDate, remarks));
        }
    } catch (SQLException exception) {
        JDBCUtils.printSQLException(exception);
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return assignmentList;
}
public boolean updateAssignment(Assignment assignment) throws SQLException {
    boolean rowUpdated = false;
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = JDBCUtils.getConnection();
        pstmt = conn.prepareStatement(UPDATE_ASSIGNMENT);
        pstmt.setString(1, assignment.getAssignmentName());
        pstmt.setInt(2, assignment.getAssignCourseId());
        pstmt.setInt(3, assignment.getAssigInstructorId());
        pstmt.setString(4, assignment.getAssignStatus());
        pstmt.setInt(5, assignment.getAssignStudentId());
        pstmt.setString(6, assignment.getAssignStudentName());
        pstmt.setString(7, assignment.getAssigndueDate().toString());
        pstmt.setString(8, assignment.getAssignRemarks());
        pstmt.setString(9, assignment.getAssignmentId());
        rowUpdated = pstmt.executeUpdate() > 0;
    } catch (SQLException exception) {
        JDBCUtils.printSQLException(exception);
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return rowUpdated;
}


public boolean deleteAssignment(String assignmentId) throws SQLException {
    boolean rowDeleted = false;
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = JDBCUtils.getConnection();
        pstmt = conn.prepareStatement(DELETE_ASSIGNMENT_BY_ID);
        pstmt.setString(1, assignmentId);
        rowDeleted = pstmt.executeUpdate() > 0;
    } catch (SQLException exception) {
        JDBCUtils.printSQLException(exception);
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return rowDeleted;
}



}



