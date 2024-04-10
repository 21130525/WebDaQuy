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
    <link rel="stylesheet" href="../../css/admin_upload.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<form action="#" method="post">
    <div class="form-group">
        <label>Bootstrap style button 1</label>
        <input type="file" id="BSbtndanger">
    </div>
</form>
<form action="#" method="post">
    <div class="form-group">
        <label>Bootstrap style button 2</label>
        <input type="file" id="BSbtnsuccess">
    </div>
</form>
<form action="#" method="post">
    <div class="form-group">
        <label>Bootstrap style button 3</label>
        <input type="file" id="BSbtninfo">
    </div>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $('#BSbtndanger').filestyle({
        buttonName : 'btn-danger',
        buttonText : ' File selection'
    });
    $('#BSbtnsuccess').filestyle({
        buttonName : 'btn-success',
        buttonText : ' Open'
    });
    $('#BSbtninfo').filestyle({
        buttonName : 'btn-info',
        buttonText : ' Select a File'
    });
</script>
</html>
