<%-- 
    Document   : register
    Created on : Apr 5, 2022, 1:49:46 AM
    Author     : DINHDAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="css/register.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="body">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="RegisterController" method="post">
                                <h3 class="text-center text-info">Registration</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Username:</label><br>
                                    <input type="text" name="username" id="username" class="form-control" value="${param.username}" placeholder="Your name account..." >
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Password:</label><br>
                                    <div class="input-group mb-3">
                                        <input type="password" name="password" id="password" class="form-control" value="${param.password}" placeholder="Your password...">
                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="bi bi-eye-slash" id="togglePassword" onclick="myFunction()"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="text-info" for="type">User Type:</label> 
                                    <select id="type" name="userType">
                                        <c:choose>
                                            <c:when test="${fn:contains(param.userType, 'false')}">
                                                <option value="true">Admin </option>
                                                <option value="false" selected>Not admin</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="true" selected>Admin </option>
                                                <option value="false">Not admin</option>
                                            </c:otherwise>
                                        </c:choose>                          
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="mess">
                                        <c:if test="${mess!=Empty}">
                                            <h5 id="mess">${mess}</h5>  
                                        </c:if> 
                                        <c:if test="${mes!=Empty}">
                                            <h5 id="mes">${mes}</h5>  
                                        </c:if> 
                                    </div>
                                    <input type="submit" name="submit" class="btn btn-info btn-md" id="sign" value="Register">
                                </div>
                                <div id="register-link" class="text-right">
                                    <label>Already have an account?</label> 
                                    <a href="LoginController" class="text-info">Login here</a>
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