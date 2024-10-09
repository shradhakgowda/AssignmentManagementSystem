<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Course Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
         <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
         
    <style>
        .custom-button {
            background-color: #4CAF50; 
            color: white;
            border-radius: 12px; 
            padding: 10px 20px;
            border: none; 
            font-size: 16px; 
            transition: background-color 0.3s, transform 0.3s; 
        }
        .custom-button:hover {
            background-color: #45a049; 
            transform: scale(1.05); 
        }
        .custom-button:focus {
            box-shadow: none; 
        }
        .btn-edit {
            background-color: #ffc107; /* Yellow */
            color: #212529; /* Dark text */
        }
        .btn-edit:hover {
            background-color: #e0a800; /* Darker yellow */
        }
        .btn-primary {
            background-color: #007bff; /* Default primary color */
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

    <div class="container my-5 pd-10" style=" margin-top: 25rem;">
        <h3 class="text-center">List of Courses</h3>
        <hr>
        
        <div class="container">
            <!-- Row for buttons -->
            <div class="row">
                <!-- Button for Add Course -->
                <div class="col-auto">
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-primary custom-button">Add Course</a>
                </div>
                <!-- Button for List Of Courses -->
                <div class="col-auto">
                    <a href="<%=request.getContextPath()%>/list" class="btn btn-primary custom-button">List Of Courses</a>
                </div>
            </div>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Description</th>
                    <th>Instructor Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courseList}">
                    <tr>
                        <td><c:out value="${course.courseName}" /></td>
                        <td><c:out value="${course.courseDescription}" /></td>
                        <td><c:out value="${course.instructorName}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${course.courseId}' />" class="btn btn-edit btn-sm">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <!-- Removed Delete button -->
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="<%=request.getContextPath()%>/Assignment/Assignment-list.jsp" class="btn btn-primary btn-sm">Assignments</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <footer class="footer mt-auto">
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
