<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Login Failed</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #495057;
        }
        .error-container {
            max-width: 600px;
            margin: 100px auto;
        }
        .alert {
            border-radius: 0.5rem;
        }
        .btn-danger {
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container error-container">
        <div class="alert alert-danger text-center">
            <h4 class="alert-heading">Login Failed</h4>
            <p>${errorMessage}</p>
            <a href="<%=request.getContextPath()%>/Register/register.jsp" class="btn btn-danger">Go Back to Registration</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
