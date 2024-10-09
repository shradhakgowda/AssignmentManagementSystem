<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AssignEase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/homeStyle.jsp">
     <style>
    body, html {
        height: 100%;
        margin: 0;
    }

    .hero {
        background-image: url('https://slidechef.net/wp-content/uploads/2021/07/school-education-background-google-slides-1024x576.jpg')!important;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        height: 100%; 
        color: rgb(255, 255, 255);
         
    }

    .navbar {
        background: rgba(150, 146, 146, 0.5);
        position: fixed; 
        width: 100%; 
        top: 0;
        z-index: 1000; 
        border-radius: 0 0 15px 15px;
    }

    .hero .display-4 {
        font-weight: bold;
        text-transform: uppercase;
        margin-bottom: 20px;
       
    }

    .hero .lead {
        margin-bottom: 30px;
        font-size: 1.2rem;
    }

    .btn-light {
        background-color: white;
        color: black;
    }

    .btn-light:hover {
        background-color: #f8f9fa;
        color: black;
    }
    
    </style> 
    
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">AssignEase</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/Home/home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Home/About.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Home/contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login/login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Register/register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="hero d-flex align-items-center justify-content-center">
        <div class="text-center">
            <h1 class="display-4 pd-5">AssignEase</h1>
            <p class="lead">AssignEase: Effortlessly Organize Your Assignments, Stay on Track, and Achieve Your Academic Goals</p>
           <a href="${pageContext.request.contextPath}/login/login.jsp" class="btn btn-dark me-2">Login</a>
            <a href="${pageContext.request.contextPath}/Register/register.jsp" class="btn btn-light">Register</a>
        </div>
       
    </section>
    
    </div>
    <footer class="fixed-bottom">
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
