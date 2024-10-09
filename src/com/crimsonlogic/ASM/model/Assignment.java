package com.crimsonlogic.ASM.model;

import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Assignment {
    private String assignmentId; // Unique identifier for the assignment
    private String assignmentName; // Name of the assignment
    private int assignCourseId; // ID of the course associated with the assignment
    private int assigInstructorId;// ID of the instructor responsible for the assignment
    private String assignStatus;//ID of
    private int assignStudentId;//student id;
    private String assignStudentName;
    private String assigndueDate;
    private String assignRemarks;// Due date for the assignment

    public Assignment(String assignmentName, int assignCourseId, int assigInstructorId,
            String assignStatus, int assignStudentId, String assignStudentName,
            String assigndueDate, String assignRemarks) {  	
this.assignmentName = assignmentName;
this.assignCourseId = assignCourseId;
this.assigInstructorId = assigInstructorId;
this.assignStatus = assignStatus;
this.assignStudentId = assignStudentId;
this.assignStudentName = assignStudentName;
this.assigndueDate = assigndueDate;
this.assignRemarks = assignRemarks;
}
	
}