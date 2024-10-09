<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AssignEase</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
          <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
          
    <style>
        .custom-button {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            border-radius: 12px; /* Rounded corners */
            padding: 10px 20px; /* Padding */
            border: none; /* Remove border */
            font-size: 16px; /* Font size */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transition */
        }
        .custom-button:hover {
            background-color: #45a049; /* Darker green on hover */
            transform: scale(1.05); /* Slight zoom effect */
        }
        .custom-button:focus {
            box-shadow: none; /* Remove box shadow on focus */
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
<body>
<jsp:include page="../common/Header.jsp"></jsp:include>

<div class="container mt-5">
    <h3 class="text-center">List of Assignments</h3>
    <hr>
    
    <!-- Row for buttons -->
    <div class="row mb-3">
        <!-- Button for Add Assignment -->
        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/Assignment?action=/assignmentnew" class="btn custom-button">Add Assignment</a>
        </div>
        <!-- Button for List of Assignments -->
        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/Assignment?action=/assignmentlist" class="btn custom-button">List Of Assignments</a>
        </div>
    </div>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Status</th>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Due Date</th>
                <th>Remarks</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="assignment" items="${assignmentList}">
                <tr>
                    <td><c:out value="${assignment.assignmentId}" /></td>
                    <td><c:out value="${assignment.assignmentName}" /></td>
                    <td><c:out value="${assignment.assignStatus}" /></td>
                    <td><c:out value="${assignment.assignStudentId}" /></td>
                    <td><c:out value="${assignment.assignStudentName}" /></td>
                    <td><c:out value="${assignment.assigndueDate}" /></td>
                    <td><c:out value="${assignment.assignRemarks}" /></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/Assignment?action=/assignmentedit&id=<c:out value='${assignment.assignmentId}' />" class="btn btn-warning btn-sm">Edit</a>
                        <a href="${pageContext.request.contextPath}/Assignment?action=/assignmentdelete&id=<c:out value='${assignment.assignmentId}' />" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<footer class="footer mt-auto">
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK3+2W4k+Qy8m6gybZ5EJ3vtebQ9w5c5gtj8m35l1B7vBcz" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UOa8F8T5fDMFf8tPz5It07mFZJZGRW5FWtbGJ/3VzYpFZQWv5g5v4KXwJ6YkFtY8" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-ChfyyoU5FfZw8e4vw5C3U0hFvpt+4U4D2D8rKx71PISYyR81E4XT8Kf9B9w2TgaJ" crossorigin="anonymous"></script>
</body>
</html>
