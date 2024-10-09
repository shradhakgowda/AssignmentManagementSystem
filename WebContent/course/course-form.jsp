<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Course Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: green">
			<div>
				<a href="#" class="navbar-brand">Course App</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/courses/list"
					class="nav-link">Courses</a></li>
			</ul>
			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><a href="<%=request.getContextPath()%>/logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div class="container col-md-6">
		<div class="card">
			<div class="card-body">
				<c:choose>
					<c:when test="${course != null}">
						<form action="<%=request.getContextPath()%>/update"
							method="post">
					</c:when>
					<c:otherwise>
						<form action="<%=request.getContextPath()%>/courses/insert"
							method="post">
					</c:otherwise>
				</c:choose>

				<caption>
					<h2>
						<c:choose>
							<c:when test="${course != null}">
                                Edit Course
                            </c:when>
							<c:otherwise>
                                Add New Course
                            </c:otherwise>
						</c:choose>
					</h2>
				</caption>

				<c:if test="${course != null}">
					<input type="hidden" name="courseId"
						value="<c:out value='${course.courseId}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Course Name</label> <input type="text" class="form-control"
						name="name" value="<c:out value='${course.courseName}' />"
						required="required" minlength="3" />
				</fieldset>

				<fieldset class="form-group">
					<label>Course Description</label>
					<textarea class="form-control" name="description"
						required="required" minlength="5"><c:out value="${course.courseDescription}" /></textarea>
				</fieldset>

				<input type="hidden" name="userId"
					value="<c:out value='${sessionScope.userid}' />" /> <input
					type="hidden" name="userName"
					value="<c:out value='${sessionScope.username}' />" />

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
