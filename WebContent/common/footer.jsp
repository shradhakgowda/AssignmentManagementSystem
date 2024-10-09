<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Elegant Footer</title>
<style>
/* Basic reset for margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Styling the footer */
.footer {
    background-color: #d3d3d3; /* Light grey color */
    color: #333; /* Darker text color for better contrast */
    text-align: center;
    padding: 5px 10px;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    font-family: Arial, sans-serif;
    border-top: 3px solid #ff5722;
}

/* Styling the links within the footer */
.footer a {
    color: #ff5722;
    text-decoration: none;
    font-weight: bold;
}

.footer a:hover {
    text-decoration: underline;
}

/* Responsive styling */
@media (max-width: 600px) {
    .footer {
        padding: 15px 5px;
    }
}
</style>
</head>

<body>
<div class="container mt-5">
  <!-- Main content of your page -->

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; 2024 AssignEase. All rights reserved.</p>

  </footer>
</div>
</body>
</html>
