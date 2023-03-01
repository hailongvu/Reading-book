<%-- 
    Document   : updateChapter
    Created on : Apr 12, 2022, 4:52:13 PM
    Author     : tung phan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Chapter</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="css/updateChap.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form class="form-horizontal" name="createForm" action="updateChapter" method="post" >
                                <c:set var="c" value="${requestScope.chapter}"></c:set>
                                    <div class="form-group">
                                        <label for="book_id" class="cols-sm-2 control-label">Chap_ID</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="chapter_id"  placeholder="ID" value="${c.id}" disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="id" class="cols-sm-2 control-label">Title</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="title"  placeholder="title" value="${c.title}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Content</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <textarea class="form-control" name="content"  rows="9" cols="70">${c.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="cols-sm-2 control-label">Book_ID</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">

                                            <input type="text" class="form-control" name="book_id"  placeholder="book_id" value="${requestScope.book_id}" disabled=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <button id="sign" type="submit" class="btn btn-info btn-md">Update
                                    </button>
                                    <a id="back" href="Edit-Chapter?id=${requestScope.book_id}" class="btn btn-dark">Back</a> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
