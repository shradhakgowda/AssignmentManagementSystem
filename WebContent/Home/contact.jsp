<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AssignEase</title>
    <link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
    
    <style>
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

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        header {
           background: #d3d3d3;
            color: #fff;
            padding-top: 10px;
            min-height: 40px;
            border-bottom: #fff 3px solid;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 2.5em;
        }

        .main-content {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .contact-info, .contact-info-static {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 48%;
        }

        .contact-info h2 {
            margin-top: 0;
        }

        .contact-info p {
            margin: 10px 0;
        }

        footer {
            background: #333;
             background: #d3d3d3;
            text-align: center;
            padding: 10px;
            position: absolute;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>AssignEase</h1>
        </div>
    </header>

    <div class="container main-content">
        <div class="contact-info">
            <h2>Contact Information</h2>
            <p><strong>Address:</strong> Garudacharplaya, Bangalore, India</p>
            <p><strong>Phone:</strong> 9742714522</p>
            <p><strong>Email:</strong> support@assignmentmanagement.com</p>
        </div>

        <div class="contact-info-static">
            <h2>Additional Information</h2>
            <p>If you have any questions or need further assistance, please feel free to contact us using the information provided above. We look forward to hearing from you!</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 AssignEase All Rights Reserved.</p>
    </footer>
</body>
</html>
