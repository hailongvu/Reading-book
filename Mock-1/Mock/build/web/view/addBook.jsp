<%-- 
    Document   : addBook
    Created on : Apr 2, 2022, 6:05:15 PM
    Author     : tung phan
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="css/addBook.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="addBook" method="post" >
                                <div class="form-group">
                                    <label for="id" class="text-info">Title</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="book_title"  placeholder="Title book..." />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="text-info">Author</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="author"  placeholder="Author..." />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="image" class="text-info">Image</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" id="img" class="form-control" name="image"  placeholder="Images..." />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="text-info">Brief</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <textarea class="form-control" name="brief"  placeholder="Brief review of the book...." cols="20" rows="5"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="des" class="text-info">Genre</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">

                                            <input type="text" class="form-control" name="genre" placeholder="Genre..." />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <button id="sign" type="submit" class="btn btn-info btn-md">Add Book
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
