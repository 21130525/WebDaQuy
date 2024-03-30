<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/3/2024
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Font+Name">--%>
<%--    <link rel="icon" href="../../img/favicon.png" type="image/x-icon">--%>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/font/fontawesome-free-6.4.2/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css">
    <style>

    </style>
</head>

<body>
<jsp:include page = "/views/header.jsp"/>
<br><br><br><br>
<div><h1 style="color:red"><%=(request.getAttribute("announced")!=null?request.getAttribute("announced"):"")%></h1></div>
<div id="container">
    <div class="img-register">
        <img src="${pageContext.request.contextPath}/img/banner/TTN-2.png">
    </div>
    <form class="form-register" action="<%=request.getContextPath()%>/register" method="post" onsubmit="return validatePassword()">

        <div class="logo">
            <img src="${pageContext.request.contextPath}/img/logo.png">
        </div>
        <div id="register">
            <h2>Đăng ký</h2>
        </div>
        <div id="inform">
            <%--user--%>
            <label for="user">Tài khoản*:</label>
            <br>
            <input type="text" name="user" placeholder="Tài khoản" id="user" value=""  pattern="^[a-zA-Z0-9]{2,10}$" title="Tên phải có 2-10 ký tự và chỉ chứa chữ cái và số." required >
            <br>
            <%--pasword--%>
            <label for="password">Mật khẩu*:</label>
            <br>
            <input type="password" name="pass" placeholder="Mật khẩu" id="password" value=""  pattern="^.{3,15}$" title="Mật khẩu phải chứa 3 đến 15 ký tự khong chứa khoản trắng và ký tự đặt biệt." required>
            <br>
            <label for="repeat">Nhập lại mật khẩu*:</label>
            <br>
            <input type="password" name="repeat" placeholder="Nhập lại mật khẩu" id="repeat" value=""  pattern="^.{3,15}$" title="Mật khẩu phải chứa 3 đến 15 ký tự khong chứa khoản trắng và ký tự đặt biệt." required>
            <br>
            <%--email--%>
            <label for="email">Email*:</label>
            <br>
            <input type="email" name="email" placeholder="Nhập email" id="email" value=""  pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$" title="Tên phải có 2-10 ký tự và chỉ chứa chữ cái và số." required>
            <br>
            <%--full name--%>
            <label for="fullname">Họ và tên:</label>
            <br>
            <input type="text" name="fullname" placeholder="Họ tên" id="fullname">
            <br>
<%--            &lt;%&ndash;gender&ndash;%&gt;--%>
<%--            <label for="gender">Giới tính:</label>--%>
<%--            <br>--%>
<%--            <input type="button" name="gender" placeholder="Giới tính:" id="gender">--%>
<%--            <br>--%>
            <%--date--%>
            <label for="date">Ngày sinh:</label>
            <br>
            <input type="date" name="date" id="date">
            <br>
            <%--phone--%>
            <label for="phone">Số điện thoại:</label>
            <br>
            <input type="tel" name="phone" id="phone">
            <br>
            <%--address--%>
            <label for="address">Địa chỉ Nhân hàng:</label>
            <br>
            <input type="text" name="address" id="address">
            <br>
            <div class="commit">
                <input type="checkbox" name="policy" id="policy" title="Bạn có chấp nhận chính sách của chúng tôi không" required>*Tôi cam kết đã đọc và chấp nhận tất cả điều khoản
                và điều kiện của dịch vụ/sản phẩm này.
            </div>
            <button id="btn" type="submit">Đăng ký</button>
        </div>


    </form>
</div>

<%--<jsp:include page="views/footer.jsp"/>--%>

<script>
    function validatePassword(){
        var password = document.getElementById("password").value;
        var repeat = document.getElementById("repeat").value;
        if (password !== repeat) {
            alert("Mật khẩu và nhập lại mật khẩu khong giống nhau");
            return false;
        }
        return true;
    }
</script>
</body>

</html>