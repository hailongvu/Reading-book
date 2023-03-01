<%-- 
    Document   : BookCase
    Created on : Apr 11, 2022, 10:29:42 PM
    Author     : DINHDAT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Case</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
        <link href="css/bookcase.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

    </head>

    <div class="tabbable">
        <p id="read"> <i class="bi bi-book-half"></i> YOUR BOOKCASE </p>
        <!--<c:set var="user" scope="session" value="${sessionScope.user}"/>-->
        <c:set var="bookcase" value="${sessionScope.bookcase}" />
    </div>
    <body>

        <div class="container">
            <c:if test="${not empty bookcase}">
                <a href="BookCaseController?action=Remove All" onclick="return confirm('Are you sure you want to remove all?')" class="btn btn-danger">Remove All </a>
                <div class="row" id="txtHint">
                    <c:forEach var="row" items="${bookcase.values()}">
                        <div class="card col-md-3">
                            <input type="hidden" name="id" value="${row.getId()}"/>
                            <img class="card-img-top" width="250px" height="300px" name="image" src="${row.getImage()}" height=70px alt="Card image cap">
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title" name="title">${row.getTitle()}</h5>
                                <a href="product-detail?id=${row.getId()}" class="btn btn-success">Read</a>
                                <a href="BookCaseController?action=Remove&id=${row.getId()}" onclick="return confirm('Are you sure you want to remove?')" class="btn btn-danger">Remove</a>
                            </div>
                        </div>
                    </c:forEach>
                </div> 
                <div class="back">
                <a href="home-user" class="btn btn-light">Back </a>
                </div>
            </c:if>
            <c:if test="${empty bookcase}">
                <h2 id="text">Don't have any books in your bookcase</h2>
                <label id="re">Return <a href="home-user" class="" >here</a> to add your favorite book!</label>
            </c:if>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
    </body>
</html>
