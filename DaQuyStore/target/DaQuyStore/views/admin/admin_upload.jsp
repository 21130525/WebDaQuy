<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/16/2024
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdminUpload</title>
    <link rel="stylesheet" href="admin_upload.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/admin-upload" method="post" enctype="multipart/form-data" class="file">
    <div class="file_content">
        <input type="file" name="file" accept="image/*" id="file_1">
        <label for="file_1">
            <i class="fa-solid fa-image"></i>
            Choose a photo</label>
    </div>
</form>
<form action="${pageContext.request.contextPath}/admin-upload" method="post" enctype="multipart/form-data" class="file">
    <div class="file_content">
        <input type="file" name="file" accept="image/*" id="file_2">
        <label for="file_2">
            <i class="fa-solid fa-image"></i>
            Choose a photo</label>
    </div>
</form>
<form action="${pageContext.request.contextPath}/admin-upload" method="post" enctype="multipart/form-data" class="file">
    <div class="file_content">
        <input type="file" name="file" accept="image/*" id="file_3">
        <label for="file_3">
            <i class="fa-solid fa-image"></i>
            Choose a photo</label>
    </div>
</form>
<form action="${pageContext.request.contextPath}/admin-upload" method="post" enctype="multipart/form-data" class="file">
    <div class="file_content">
        <input type="file" name="file" accept="image/*" id="file_4">
        <label for="file_4">
            <i class="fa-solid fa-image"></i>
            Choose a photo</label>
    </div>
</form>
<form action="${pageContext.request.contextPath}/admin-upload" method="post" enctype="multipart/form-data" class="file">
    <div class="file_content">
        <input type="file" name="file" accept="image/*" id="file_5">
        <label for="file_5">
            <i class="fa-solid fa-image"></i>
            Choose a photo</label>
    </div>
</form>



</body>
</html>
