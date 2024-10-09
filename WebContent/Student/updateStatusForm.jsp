<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Assignment Status</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-group {
            width: 100%;
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
                <h2>Edit Assignment Status</h2>

                <form action="${pageContext.request.contextPath}/updateStatusAssignment" method="post">
                    <!-- Hidden Fields for Existing Assignment -->
                    <input type="hidden" name="assignmentId" value="${existingAssignment2.assignmentId}" />
                    <input type="hidden" name="assignCourseId" value="${existingAssignment2.assignCourseId}" />
                    <input type="hidden" name="assignInstructorId" value="${existingAssignment2.assigInstructorId}" />
                    <input type="hidden" name="assignName" value="${existingAssignment2.assignmentName}" />
                   <input type="hidden" name="assignStudentId" value="${existingAssignment2.assignStudentId}" />
                   <input type="hidden" name="assignStudentName" value="${existingAssignment2.assignStudentName}" />
                  <input type="hidden" name="assignDueDate" value="${existingAssignment2.assigndueDate}" />
                  <input type="hidden" name="assignRemarks" value="${existingAssignment2.assignRemarks}" />
                 
        
                    <!-- Assignment Status Field -->
                    <div class="form-group">
                        <label for="assignStatus">Assignment Status</label>
                        <input type="text" id="assignStatus" name="assignStatus" class="form-control"
                               value="<c:out value='${existingAssignment2.assignStatus}' />" required minlength="3" />
                    </div>

                    <button type="submit" class="btn btn-primary">Update Status</button>
                </form>
            </div>
        </div>
    </div>

    <footer class="footer mt-auto">
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
