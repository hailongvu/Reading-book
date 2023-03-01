<%-- 
    Document   : homeLogin
    Created on : Apr 5, 2022, 12:35:49 AM
    Author     : DINHDAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="css/login.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="LoginController" method="post">
                                <h3 class="text-center text-info">Login</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Username:</label><br>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="Your name account..." >
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Password:</label><br>
                                    <div class="input-group mb-3">
                                        <input type="password" name="password" id="password" class="form-control" placeholder="Your password...">
                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="bi bi-eye-slash" id="togglePassword" onclick="myFunction()"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <br>
                                    <p class="text-danger">
                                        <%
                                            if (session.getAttribute("mess") == null) {
                                                session.setAttribute("mess", "");
                                            }
                                            out.println(session.getAttribute("mess"));
                                            session.removeAttribute("mess");
                                        %>
                                    </p>
                                    <input type="submit" name="submit" class="btn btn-info btn-md" id="sign" value="Sign In">
                                </div>
                                <div id="register-link" class="text-right">
                                    <label>Not a member?</label>
                                    <a href="RegisterController" class="text-info">Register now</a>
                                </div>
                                <div class="back">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/login.js"></script>
    </body>
</html>
