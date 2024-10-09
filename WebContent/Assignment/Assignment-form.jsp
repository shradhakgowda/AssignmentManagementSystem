<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title><c:out value="${existingAssignment != null ? 'Edit' : 'Add'}" /> Assignment</title>
   <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-group {
            width: 100%;
        }
        body {
            background-color: #f8f9fa;
        }
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-image: url('https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3440.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <jsp:include page="../common/Header.jsp"></jsp:include>

    <div class="container my-5">
        <div class="row">
            <div class="col">
                <h2>
                    <c:out value="${existingAssignment != null ? 'Edit' : 'Add'}" /> Assignment
                </h2>

                <c:choose>
                    <c:when test="${existingAssignment != null}">
                        <!-- Form for editing an existing assignment -->
                        <form action="${pageContext.request.contextPath}/Assignment?action=/assignmentupdate" method="post"
                              class="bg-light border border-light rounded py-5 px-5">
                            <!-- Hidden Fields for Existing Assignment -->
                            <input type="hidden" name="assignmentId" value="${existingAssignment.assignmentId}" />
                            <input type="hidden" name="assignCourseId" value="${sessionScope.courseid}" />
                            <input type="hidden" name="assignInstructorId" value="${sessionScope.userid}" />
                            
                            <!-- Assignment Name Field -->
                            <div class="form-group">
                                <label for="assignName">Assignment Name</label>
                                <input type="text" id="assignName" name="assignName" class="form-control"
                                       value="<c:out value='${existingAssignment.assignmentName}' />" required minlength="3" />
                            </div>

                            <!-- Assignment Status Field -->
                            <div class="form-group">
                                <label for="assignStatus">Assignment Status</label>
                                <input type="text" id="assignStatus" name="assignStatus" class="form-control"
                                       value="<c:out value='${existingAssignment.assignStatus}' />" required minlength="3" />
                            </div>

                            <!-- Student ID Field -->
                            <div class="form-group">
                                <label for="assignStudentId">Student ID</label>
                                <input type="text" id="assignStudentId" name="assignStudentId" class="form-control"
                                       value="<c:out value='${existingAssignment.assignStudentId}' />" required />
                            </div>

                            <!-- Student Name Field -->
                            <div class="form-group">
                                <label for="assignStudentName">Student Name</label>
                                <input type="text" id="assignStudentName" name="assignStudentName" class="form-control"
                                       value="<c:out value='${existingAssignment.assignStudentName}' />" />
                            </div>

                            <!-- Due Date Field -->
                            <div class="form-group">
                                <label for="assignDueDate">Due Date</label>
                                <input type="date" id="assignDueDate" name="assignDueDate" class="form-control"
                                       value="<c:out value='${existingAssignment.assigndueDate}' />" required />
                            </div>

                            <!-- Remarks Field -->
                            <div class="form-group">
                                <label for="assignRemarks">Remarks</label>
                                <textarea id="assignRemarks" name="assignRemarks" class="form-control" rows="4">
                                    <c:out value='${existingAssignment.assignRemarks}' />
                                </textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">
                                <c:out value="${existingAssignment != null ? 'Update' : 'Submit'}" />
                            </button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <!-- Form for inserting a new assignment -->
                        <form action="${pageContext.request.contextPath}/Assignment?action=/insertAssignment" method="post"
                              class="bg-light border border-light rounded py-5 px-5">
                            <!-- Hidden Fields for New Assignment -->
                            <input type="hidden" name="assignCourseId" value="${sessionScope.courseid}" />
                            <input type="hidden" name="assignInstructorId" value="${sessionScope.userid}" />
                            
                            <!-- Assignment Name Field -->
                            <div class="form-group">
                                <label for="assignName">Assignment Name</label>
                                <input type="text" id="assignName" name="assignName" class="form-control"
                                       required minlength="3" />
                            </div>

                            <!-- Assignment Status Field -->
                            <div class="form-group">
                                <label for="assignStatus">Assignment Status</label>
                                <input type="text" id="assignStatus" name="assignStatus" class="form-control"
                                       required minlength="3" />
                            </div>

                            <!-- Student ID Field -->
                            <div class="form-group">
                                <label for="assignStudentId">Student ID</label>
                                <input type="text" id="assignStudentId" name="assignStudentId" class="form-control"
                                       required />
                            </div>

                            <!-- Student Name Field -->
                            <div class="form-group">
                                <label for="assignStudentName">Student Name</label>
                                <input type="text" id="assignStudentName" name="assignStudentName" class="form-control" />
                            </div>

                               <div class="form-group">
                                <label for="assignDueDate">Due Date</label>
                                <input type="date" id="assignDueDate" name="assignDueDate" class="form-control" required />
                            </div>

                            <!-- Remarks Field -->
                            <div class="form-group">
                                <label for="assignRemarks">Remarks</label>
                                <textarea id="assignRemarks" name="assignRemarks" class="form-control" rows="4"></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <footer class="footer mt-auto">
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        function setMinDate() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('assignDueDate').setAttribute('min', today);
        }

        document.addEventListener('DOMContentLoaded', setMinDate);
    </script>
</body>
</html>
