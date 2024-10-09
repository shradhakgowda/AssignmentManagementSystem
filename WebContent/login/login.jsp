<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssignEase</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
<style>
    body {
        background-image: url('https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3440.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }
    .login-container {
        margin-top: 5%;
    }
    .login-image {
        max-width: 100%;
        height: auto;
    }
    
</style>
</head>

<body>
    <jsp:include page="../common/Header.jsp"></jsp:include>
    <div class="container login-container">
        <div class="row">
            <div class="col-md-6 d-flex align-items-center">
                <img src="https://cdn.dribbble.com/users/4241563/screenshots/11874468/media/7796309c77cf752615a3f9062e6a3b3d.gif" alt="Placeholder Image" class="login-image">
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div>
                        <h4 class="card-title m-2 text-center">Login Here</h4>
                    </div>
                    <div class="card-body">
                        <!--  action is used to call servlet code or controller 
                        code that should execute when form is submitted -->
                        <form action="<%=request.getContextPath()%>/login" method="post">
                            <div class="form-group">
                                <label for="username">User Name:</label>
                                <input type="text" class="form-control" id="username" placeholder="User Name" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="role">Role:</label>
                                <div class="form-check">
                                    <input type="radio" id="instructor" name="role" value="instructor" class="form-check-input">
                                    <label for="instructor" class="form-check-label">Instructor</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" id="student" name="role" value="student" class="form-check-input">
                                    <label for="student" class="form-check-label">Student</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
