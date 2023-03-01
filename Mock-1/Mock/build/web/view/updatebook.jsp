<%-- 
    Document   : updatebook
    Created on : Apr 5, 2022, 3:29:43 PM
    Author     : tung phan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
       <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="css/updateBook.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
       <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form"  action="updateBook" method="post" >
                                <c:set var="b" value="${requestScope.book}"/>
                                <div class="form-group">
                                    <label for="book_id" class="text-info">ID</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="book_id"  placeholder="ID" value="${b.id}" disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="id" class="text-info">Title</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="book_title"  placeholder="title" value="${b.title}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="text-info">Author</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="author"  placeholder="AUTHOR" value="${b.author}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="image" class="text-info">Image</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="image"  placeholder="IMAGES" value="${b.image}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="text-info">Brief</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="brief"  placeholder="brief" value="${b.brief}" 
                                                   style=""  />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="des" class="text-info">Genre</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="genre" placeholder="Category" value="${b.genre}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <button id="sign" type="submit" class="btn btn-info btn-md">Update
                                    </button>
                                    <a id="back" href="HomeAdmin" class="btn btn-dark">Back</a> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
