<%-- 
    Document   : ChapterDetail
    Created on : Apr 2, 2022, 3:35:52 PM
    Author     : hailo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chapter Detail</title>
        <link href="css/chapter.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header class="post-header">
            <h1 class="post-title">${chapter.title}</h1>
        </header>

        <div class="post-body">
            <p class="post-lede">
                ${chapter.content}
            </p>
            <p style="float: right;">
                <button class="button" onclick="history.back()">Go Back</button>
            </p>
        </div>

    </body>
</html>
