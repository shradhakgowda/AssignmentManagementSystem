package com.crimsonlogic.ASM.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Course {

    private int courseId; // Renamed from course_id
    private String courseName;
    private String courseDescription;
    private int instructorId; // Renamed from courseInstructorId
    private String instructorName; // Renamed from courseInstructorName

    public Course(int courseId, String courseName, String courseDescription, int instructorId, String instructorName) {
        super();
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseDescription = courseDescription;
        this.instructorId = instructorId;
        this.instructorName = instructorName;
    }
    public Course( String courseName, String courseDescription, int instructorId, String instructorName) {
        super();
       
        this.courseName = courseName;
        this.courseDescription = courseDescription;
        this.instructorId = instructorId;
        this.instructorName = instructorName;
    }

    @Override
    public String toString() {
        return "Course [courseId=" + courseId + ", courseName=" + courseName + ", courseDescription="
                + courseDescription + ", instructorId=" + instructorId + ", instructorName=" + instructorName + "]";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Course other = (Course) obj;
        if (instructorId != other.instructorId)
            return false;
        if (courseDescription == null) {
            if (other.courseDescription != null)
                return false;
        } else if (!courseDescription.equals(other.courseDescription))
            return false;
        if (courseId != other.courseId)
            return false;
        if (courseName == null) {
            if (other.courseName != null)
                return false;
        } else if (!courseName.equals(other.courseName))
            return false;
        if (instructorName == null) {
            if (other.instructorName != null)
                return false;
        } else if (!instructorName.equals(other.instructorName))
            return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + instructorId;
        result = prime * result + ((courseDescription == null) ? 0 : courseDescription.hashCode());
        result = prime * result + courseId;
        result = prime * result + ((courseName == null) ? 0 : courseName.hashCode());
        result = prime * result + ((instructorName == null) ? 0 : instructorName.hashCode());
        return result;
    }
}
