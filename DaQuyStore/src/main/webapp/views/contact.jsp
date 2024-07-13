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
    <title>Liên hệ</title>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>
    <div class="row mt-5">
        <div class="col ">
            <img src="${pageContext.request.contextPath}/img/dai-hoc-long-lam.jpg" alt="" style="width: 600px;height: 600px">
        </div>
        <div class="col w-100" style="width: 650px;height: 650px" >
            <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.1986922460546!2d106.78813967465993!3d10.872487157415222!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1698824490776!5m2!1svi!2s"
                    width="600" height="600" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
    <div class="contact">
        <div class="contact-label">
            Liên Hệ
        </div>
        <div class="contact-number-choosing">
            <a href="#" class="landline">
                <div class="landline-label">
                    Số máy bàn
                </div>
                <div class="landline-num">
                    08856 174 581
                </div>
            </a>
            <a href="#" class="hotline">
                <div class="hotline-label">
                    Hotline
                </div>
                <div class="hotline-num">
                    0856 174 581
                </div>
                <div class="time-line">
                    (8h00 - 21h00)
                </div>
            </a>
            <a href="#" class="counselors">
                <div class="counselors-label">
                    Tư vấn viên
                </div>
                <div class="counselors-num">
                    0988 458 352
                </div>
            </a>
            <a href="#" class="chat-zalo-whatapp-wechat">
                <div class="chat-zalo-whatapp-wechat-label">
                    Chat Zalo/Whatapp/Wechat
                </div>
                <div class="chat-zalo-whatapp-wechat-num">
                    0856 174 581
                </div>
            </a>
        </div>
    </div>
    <div class="contact-us">
        <div class="all-store-and-showroom">
            <div class="showroom pull-up">
                <div class="showroom-label normal-text">
                    SHOWROOM
                </div>
                <div class="showroom-text small-text">
                    Khu phố 6, phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí Minh
                </div>
            </div>
            <div class="store-1 pull-down">
                <div class="store-1-label normal-text">
                    STORE 1
                </div>
                <div class="store-1-text small-text">
                    Tòa thiên lý (khu phố 6, phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí Minh)
                </div>
            </div>
            <div class="store-2 pull-up">
                <div class="store-2-label normal-text">
                    STORE 2
                </div>
                <div class="store-2-text small-text">
                    Tòa Phượng Vỹ (khu phố 6, phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí Minh)
                </div>
            </div>
            <div class="store-3 pull-down">
                <div class="store-3-label normal-text">
                    STORE 3
                </div>
                <div class="store-3-text small-text">
                    Khoa Công Nghệ Thông Tin (khu phố 6, phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí
                    Minh)
                </div>
            </div>
        </div>
        <form method="post" action="<%=request.getContextPath()+"/feedback"%>" method="post">
            <div class="contact-us-right-box">
                <div class="contact-us-label">
                    LIÊN HỆ VỚI CHÚNG TÔI
                </div>
                <input type="text" class="full-name input-box" placeholder="Họ tên(*)" name="fullname">
                <input type="text" class="phone-num input-box" placeholder="Số điện thoại(*)" name="phone">
                <input type="text" class="email input-box" placeholder="Email" name="email">
                <input type="text" class="title input-box" placeholder="Tiêu đề" name="phone">
                <textarea name="content" id="content" class="content input-box" cols="30" rows="10"
                          placeholder="Nội dung" name="content"></textarea>
                <button class="sending" type="submit">
                    Gửi
                </button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</html>
