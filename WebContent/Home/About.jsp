<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us - AssignEase</title>
<link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
          background-image: url('https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3440.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        color: #333;
    }
    .container {
        width: 80%;
        margin: auto;
        overflow: hidden;
    }
    .hero {
        background: rgba(150, 146, 146, 0.5);
        color: #fff;
        padding: 40px 20px;
        text-align: center;
        border-bottom: 5px solid #004080;
    }
    .hero h1 {
        margin: 0;
        font-size: 2.5em;
    }
    .hero p {
        font-size: 1.2em;
    }
    .content {
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-top: -20px; /* Overlap hero section */
        z-index: 1;
    }
    h2 {
        color: #333;
        border-bottom: 2px solid #0066cc;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    p {
        line-height: 1.6;
    }
    ul {
        list-style-type: disc;
        margin: 20px 0;
        padding: 0 20px;
    }
    li {
        margin-bottom: 10px;
    }
    .section {
        margin-bottom: 40px;
    }
    .button {
        display: inline-block;
        font-size: 16px;
        color: #fff;
        background: #0066cc;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s;
    }
    .button:hover {
        background: #004080;
    }
</style>
</head>
<body>
    <!-- Assuming header and footer will be added here -->

    <div class="hero">
        <div class="container">
            <h1>AssignEase</h1>
            <p>AssignEase: Effortlessly Organize Your Assignments, Stay on Track, and Achieve Your Academic Goals</p>
        </div>
    </div>

    <div class="container">
        <div class="content">
            <h2>About Us</h2>
            <p>Welcome to AssignEase, the comprehensive solution for managing academic assignments. Our platform is designed to support students, instructors, and courses, streamlining the assignment process and enhancing educational efficiency.</p>

            <div class="section">
                <h2>For Students</h2>
                <p>AssignEase provides students with a user-friendly interface to manage their assignments effectively. Key features include:</p>
                <ul>
                    <li><strong>Easy Submission:</strong> Submit assignments quickly and receive confirmation instantly.</li>
                    <li><strong>Deadline Management:</strong> Track all your deadlines and stay organized with reminders.</li>
                    <li><strong>Feedback and Grades:</strong> View detailed feedback and grades from instructors in one place.</li>
                </ul>
            </div>

            <div class="section">
                <h2>For Instructors</h2>
                <p>AssignEase offers instructors powerful tools to manage and grade assignments efficiently. Key features include:</p>
                <ul>
                    <li><strong>Efficient Grading:</strong> Grade assignments quickly with a streamlined grading interface.</li>
                    <li><strong>Assignment Tracking:</strong> Track the submission status and progress of all assignments easily.</li>
                    <li><strong>Feedback Tools:</strong> Provide detailed feedback to students directly through the platform.</li>
                </ul>
            </div>

            <div class="section">
                <h2>For Courses</h2>
                <p>AssignEase integrates assignment management with course administration, offering features such as:</p>
                <ul>
                    <li><strong>Course Management:</strong> Organize assignments by course and manage multiple classes efficiently.</li>
                    <li><strong>Integration with Syllabus:</strong> Align assignments with course syllabi and learning objectives.</li>
                    <li><strong>Comprehensive Reporting:</strong> Generate reports on assignment submissions and performance by course.</li>
                </ul>
            </div>

            <div class="section">
                <h2>Why Choose AssignEase?</h2>
                <p>AssignEase stands out with its intuitive design and robust functionality. Whether you're a student seeking organization or an instructor needing effective grading tools, AssignEase provides a tailored solution for all your assignment management needs.</p>
                                     <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Home/home.jsp">logout</a>
                    </li>
                
            </div>
        </div>
    </div>

    <!-- Assuming footer will be added here -->
</body>
</html>
