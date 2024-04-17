<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/3/2024
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang Chủ</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">    <link rel="stylesheet" href="<%=request.getContextPath()%>/font/fontawesome-free-6.4.2/css/all.css">
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="">
    <%--main--%>
    <div class="main">
        <div class="banner">
            <img class="background-image" src="../img/banner/banner.png" alt="Background Image">
            <div class="content">
                <h1 class="title-name"> TTN STORE </h1>
                <p class="intro">TTN Shop tự hào là điểm đến lý tưởng cho những người yêu thích đá quý. Với một bộ sưu
                    tập
                    đa dạng, chúng tôi cung cấp những sản phẩm chất lượng cao, từ đá quý tự nhiên đến các mảnh nghệ
                    thuật
                    thủ công tinh tế. Khám phá sự đẹp tinh khôi của tự nhiên tại TTN Shop ngay hôm nay!</p>
            </div>
        </div>
        <div class="categogies-grid-container">
            <%--            <jsp:include page="/category/category.jsp"></jsp:include>--%>
            <div class="jewelry-categogies">
                <h2 class="title-h2"> TRANG SỨC </h2>
                <div class="banner-jewelry">
                    <div class="w3-content w3-section" style="max-width:100%">
                        <img class="mySlides" src="../img/banner/jewelry.png" style="width:100%">
                        <img class="mySlides" src="../img/banner/jewelry-2.png" style="width:100%">
                        <img class="mySlides" src="../img/banner/jewelry-3.png" style="width:100%">
                    </div>
                </div>
                <%--list product--%>
                <jsp:include page="web/product/listProduct.jsp"/>

            </div>
            <div class="categogies-new">
                <h2 class="title-h2"> SẢN PHẨM MỚI</h2>
                <%--                <jsp:include page="product/products-new.jsp"></jsp:include>--%>
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<jsp:include page="footer.jsp"/>

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {
            myIndex = 1
        }
        x[myIndex - 1].style.display = "block";
        setTimeout(carousel, 2000); // 2 giây chuyển
    }
</script>
</body>
</html>
