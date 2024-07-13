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
    <meta charset="UTF-8" type="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,
    minimum-scale=1,maximum-scale=1, user-scalable-no">
    <title>Liên hệ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="contact-wrap">
    <div class="contact-in">
        <h1>THÔNG TIN LIÊN HỆ</h1>
        <h2><i class="fa fa-phone" aria-hidden="true"></i>Hotline</h2>
        <p>0564701860</p>
        <h2><i class="fa fa-envelope" aria-hidden="true"></i>Email</h2>
        <p>mintaeyeon1978@gmail.com</p>
        <h2><i class="fa fa-map-marker" aria-hidden="true"></i>Địa chỉ</h2>
        <p>Số 1, Khu phố 6, Linh Trung, Thủ Đức,Tp.Hồ Chí Minh</p>
        <ul>
            <li><a href="https://www.facebook.com/tai.votan.9655" target="_blank"><i class="fab fa-facebook"></i></a>
            </li>
            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
            <li><a href="#"><i class="fab fa-google"></i></a></li>
            <li><a href="#"><i class="fab fa-instagram"></i></a></li>

        </ul>
    </div>
    <div class="contact-in">
        <h1>Phản ánh từ khách hàng</h1>
        <form action="sendmail" method="post">
            <input type="text" required="" placeholder="Họ và tên" name="fullname" class="contact-in-input">
            <input type="text" required="" placeholder="Email" name="email" class="contact-in-input">
            <input type="text" required="" placeholder="Chủ đề" name="subject" class="contact-in-input">
            <textarea placeholder="Nội dung" required="" name="message" class="contact-in-textarea"></textarea>
            <input id="submit" type="submit" value="GỬI" class="contact-in-btn">
        </form>
    </div>
    <div class="contact-in">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2145947051063!2d106.78918677279343!3d10.871276389283322!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1720721454209!5m2!1svi!2s"
                width="100%" height="auto" style="border:0;" allowfullscreen=""
                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
