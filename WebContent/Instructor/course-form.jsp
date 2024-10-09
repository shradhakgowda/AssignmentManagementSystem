<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Management Application</title>
    <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
    
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        .content {
            flex: 1;
        }
        .footer {
            background-color: grey;
            postion:fi
            color: white;
            padding: 10px 0;
            text-align: center;
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
                .card-body {
            padding: 
rem; /* Adjust padding as needed */
        }
        
    </style>
</head>
<body class="d-flex flex-column">
    <jsp:include page="../common/Header.jsp"></jsp:include>
    <div class="container content">
        <div class="card mt-3">
            <div class="card-body">
                <c:choose>
                    <c:when test="${existingCourse != null}">
                        <form action="<%= request.getContextPath() %>/update" method="post">
                            <input type="hidden" name="id" value="<c:out value='${existingCourse.courseId}' />" />
                    </c:when>
                    <c:otherwise>
                        <form action="<%= request.getContextPath() %>/insert" method="post">
                    </c:otherwise>
                </c:choose>

                <caption>
                    <h2>
                        <c:choose>
                            <c:when test="${existingCourse != null}">
                                Edit Course
                            </c:when>
                            <c:otherwise>
                                Add New Course
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </caption>

                <fieldset class="form-group">
                    <label for="name">Course Name</label>
                    <input type="text" id="name" name="name" class="form-control"
                           value="<c:out value='${existingCourse.courseName}' />"
                           required minlength="3" />
                </fieldset>

                <fieldset class="form-group">
                    <label for="description">Course Description</label>
                    <textarea id="description" name="description" class="form-control"
                              required minlength="5"><c:out value="${existingCourse.courseDescription}" /></textarea>
                </fieldset>

                <input type="hidden" name="userId" value="<c:out value='${sessionScope.userid}' />" />
                <input type="hidden" name="userName" value="<c:out value='${sessionScope.username}' />" />

                <button type="submit" class="btn btn-success">Save Course</button>
                </form>
            </div>
        </div>
    </div>
    <footer class="fixed-bottom">
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
