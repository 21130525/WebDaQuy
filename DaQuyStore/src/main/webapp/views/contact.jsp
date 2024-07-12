<%--
  Created by IntelliJ IDEA.
  User: trant
  Date: 12/19/2023
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" ;type="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,
    minimum-scale=1,maximum-scale=1, user-scalable-no">
    <title>Liên hệ</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-xxx" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" type="text/css">
</head>
<body>
<div>
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="contact-wrap" style="margin-top: 10px;" >
    <div class="contact-in">
        <h1>THÔNG TIN LIÊN HỆ</h1>
        <h2><i class="fa fa-phone" aria-hidden="true"></i>Hotline</h2>
        <p>0564701860</p>
        <h2><i class="fa fa-envelope" aria-hidden="true"></i>Email</h2>
        <p>mintaeyeon1978@gmail.com</p>
        <h2><i class="fa fa-map-marker" aria-hidden="true"></i>Địa chỉ</h2>
        <p>Số 1, Khu phố 6, Linh Trung, Thủ Đức,Tp.Hồ Chí Minh</p>
        <ul>
            <li><a href="https://www.facebook.com/tai.votan.9655" target="_blank"><i class="fab fa-facebook"></i></a></li>
            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
            <li><a href="#"><i class="fab fa-google"></i></a></li>
            <li><a href="#"><i class="fab fa-instagram"></i></a></li>

        </ul>
    </div>
    <div class="contact-in">
        <h1>Phản ánh từ khách hàng</h1>
        <form>
            <input type="text" placeholder="Họ và tên" class="contact-in-input">
            <input type="text" placeholder="Email" class="contact-in-input">
            <input type="text" placeholder="Chủ đề" class="contact-in-input">
            <textarea placeholder="Nội dung" class="contact-in-textarea"></textarea>
            <input type="submit" value="GỬI" class="contact-in-btn">
        </form>
    </div>
    <div class="contact-in">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2145947051063!2d106.78918677279343!3d10.871276389283322!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1720721454209!5m2!1svi!2s"
                width="100%" height="auto" style="border:0;" allowfullscreen=""
                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"--%>
<%--        crossorigin="anonymous"></script>--%>
</html>
