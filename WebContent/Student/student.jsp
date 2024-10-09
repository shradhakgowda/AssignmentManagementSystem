<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="java.util.List,javax.servlet.http.HttpSession,com.crimsonlogic.ASM.model.Assignment"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AssignEase</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="styles.css" rel="stylesheet">
<link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
<style>
body {
	background-color: #f8f9fa;
	background-image: url('https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3440.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

header {
	border-bottom: 1px solid #e0e0e0;
	padding-bottom: 1rem;
}

section {
	margin-bottom: 2rem;
}

.card {
	margin-top: 1rem;
}

.list-group-item {
	border: 1px solid #e0e0e0;
}

.list-group-item:hover {
	background-color: #f1f1f1;
}

.btn-primary {
	background-color: #007bff;
}

.btn-danger {
	background-color: #dc3545;
}

.carousel {
	margin-top: 3rem;
}

.carousel-item img {
	width: 100%;
	height: 400px;
	object-fit: cover;
}

.carousel-caption {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding: 2rem;
    text-align: center;
    background-color: rgba(0, 0, 0, 0.5);
    color: #fff;
}
</style>
<jsp:include page="../common/Header.jsp"></jsp:include>
</head>
<body>
	<%
		List<Assignment> list = (List<Assignment>) session.getAttribute("assignmentList1");
		System.out.println(list);
	%>

	<!-- Carousel Slider -->
	<div id="carouselExampleIndicators" class="carousel slide mb-4">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="carousel-caption">
					<h1>Welcome, ${sessionScope.studentusername}!</h1>
					<p>Current date: <span id="currentDate"></span></p>
				</div>
				<img src="https://th.bing.com/th/id/OIP.QV_bF58n7raqQmqsKsgMawHaEK?rs=1&pid=ImgDetMain" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption">
					<h1>Welcome, ${sessionScope.studentusername}!</h1>
					<p>Current date: <span id="currentDate"></span></p>
				</div>
				<img src="https://th.bing.com/th/id/OIP.4yn--JPFg0B-tgyvgsCNjwHaFx?w=1000&h=780&rs=1&pid=ImgDetMain" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<div class="carousel-caption">
					<h1>Welcome, ${sessionScope.studentusername}!</h1>
					<p>Current date: <span id="currentDate"></span></p>
				</div>
				<img src="https://e0.pxfuel.com/wallpapers/240/955/desktop-wallpaper-medical-school-medical-laptop.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<h2>My Assignments</h2>
	<c:choose>
		<c:when test="${not empty sessionScope.assignmentList1}">
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Assignment Id</th>
						<th>Due Date</th>
						<th>Course ID</th>
						<th>Status</th>
						<th>Remarks</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="assignment" items="${sessionScope.assignmentList1}">
						<tr>
							<td><c:out value="${assignment.assignmentId}" /></td>
							<td><c:out value="${assignment.assigndueDate}" /></td>
							<td><c:out value="${assignment.assignCourseId}" /></td>
							<td><c:out value="${assignment.assignStatus}" /></td>
							<td><c:out value="${assignment.assignRemarks}" /></td>
							<td>
								<a href="${pageContext.request.contextPath}/updateStatusServlet?Id=<c:out value='${assignment.assignmentId}' />" class="btn btn-warning btn-sm">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<p>No assignments available. You're all clear.</p>
		</c:otherwise>
	</c:choose>

	<!-- Logout -->
	<section>
		<a href="${pageContext.request.contextPath}/Home/home.jsp" class="btn btn-danger">LOGOUT</a>
	</section>

	<script>
		// Function to format the date as 'DD-MM-YYYY'
		function formatDate(date) {
			var day = ("0" + date.getDate()).slice(-2);
			var month = ("0" + (date.getMonth() + 1)).slice(-2); // Months are zero-based
			var year = date.getFullYear();
			return day + "-" + month + "-" + year;
		}

		// Function to display the current date
		function displayCurrentDate() {
			var now = new Date(); // Get the current date and time
			var formattedDate = formatDate(now); // Format the date
			document.getElementById("currentDate").textContent = formattedDate; // Display the date
		}

		// Call the function once the page is loaded
		window.onload = function() {
			displayCurrentDate();
		};
	</script>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
