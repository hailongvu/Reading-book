<%-- 
    Document   : EditChapter
    Created on : Apr 15, 2022, 1:24:16 PM
    Author     : DINHDAT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home User</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    </head>
    <div class="tabbable">
        <p id="read"> <i class="bi bi-book-half"></i> READING BOOK</p>
        <form class="form-inline my-2 my-lg-0">
            <input oninput="searchBook(this.value)" value="${txtS}" name="txt" type="text"  id="search" class="form-control mr-sm-2"  placeholder="Search" aria-label="Search">
        </form>
        <c:set var="user" scope="session" value="${sessionScope.user}"/>
        <ul class="nav" id="myTab">
            <div class="mess">
            </div>    
            <a id="add" href="Show-BockCase" class="btn btn-primary">View Bookcase </a>
            <c:if test="${sessionScope.cus != null}">
                <li><p href="home">Welcome ${sessionScope.cus.username}!</p></li>
                </c:if>
                <c:if test="${sessionScope.cus == null}">      
                <a id="log" class="btn btn-primary" href="LoginController">
                    Login
                </a>
            </c:if>
            <c:if test="${sessionScope.cus != null}">      
                <a id="log" class="btn btn-danger" href="LogoutController">
                    Logout
                </a>
            </c:if>
        </ul>
    </div>
    <body>
        <div class="container">
            <div class="row" id="txtHint">
                <c:forEach items="${listBook}" var="o">
                    <div class="card col-md-3">
                        <input type="hidden" name="id" value="${o.id}"/>
                        <img class="card-img-top" width="250px" height="300px" name="image" src="${o.image}" alt="Card image cap">
                        <div class="card-body" style="text-align: center">
                            <h5 class="card-title" name="title" >${o.title}</h5>
                            <a href="product-detail?id=${o.id}" class="btn btn-success">Read</a>
                            <a href="BookCaseController?action=Add to Bookcase&id=${o.id}&title=${o.title} &image=${o.image}" class="btn btn-warning">Add to BookCase</a>
                        </div>
                    </div>
                </c:forEach>
            </div>       
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
        <script src="js/homeUser.js"></script>
    </body>
</html>
