<%-- 
    Document   : ProductDetail
    Created on : Apr 2, 2022, 2:49:12 PM
    Author     : hailo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Bentham|Playfair+Display|Raleway:400,500|Suranna|Trocchi" rel="stylesheet">
        <title>Detail Book</title>
        <link href="css/product_detail.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <div class="product-img">
                <img src="${book.image}" height="420" width="327">
            </div>
            <div class="product-info">
                <div class="product-text">
                    <h1>${book.title}</h1>
                    <h2>${book.author}</h2>
                    <p>${book.brief}</p>
                </div>
                <div class="product-price-btn">
                    <div class="chapter-info">
                        <c:forEach var="o" items="${book.listChapters}">
                            <div>
                                <a href="chapter-detail?id=${o.id}" >${o.title}</a> 
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="back">
                <a href="home-user" >Back</a> 
            </div>
        </div>
    </body>
</html>
