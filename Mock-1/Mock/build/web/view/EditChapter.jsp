<%-- 
    Document   : EditChapter
    Created on : Apr 15, 2022, 1:24:16 PM
    Author     : DINHDAT
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Bentham|Playfair+Display|Raleway:400,500|Suranna|Trocchi" rel="stylesheet">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
        <title>Edit Chapter</title>
        <link href="css/editChap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="back">
            <a href="HomeAdmin" class="btn btn-dark">Back</a> 
        </div>
        <div class="wrapper">
            <div class="product-img">
                <img src="${book1.image}" height="600" width="327">
            </div>
            <div class="product-info">
                <div class="product-text">
                    <h1>${book1.title}</h1>
                    <h2>${book1.author}</h2>
                    <p>${book1.brief}</p>
                    <input type="hidden" value="${book1.id}" />
                </div>
                <div class="chapter-info">
                    <a  href="addChapter?id=${book1.id}" class="btn btn-outline-primary" >Add</a>
                    <c:forEach var="o" items="${book1.listChapters}">
                        <div>
                            <a href="chapter-detail?id=${o.id}" >${o.title}</a> 
                            <a class="btn btn-outline-success mt-auto" href="updateChapter?id=${o.id}&&book_id=${book1.id}"  style="margin: 0 auto; color: black;">Update</a>
                            <a class="btn btn-outline-danger" style="margin: 10px 0;" href="deleteChapter?id=${o.id}&&book_id=${book1.id}">Delete</a> 
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>

