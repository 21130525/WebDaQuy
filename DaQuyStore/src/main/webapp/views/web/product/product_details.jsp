<%@ page import="model.Product" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/5/2024
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi Tiết sản phẩm</title>
    <!-- link bootstrap -->
    <style>
        #product-detail {}

        #product-detail .img-product img {
            height: 510px;
            width: 550px;
        }

        #product-detail .sub-img img {
            margin-top: 10px;
            height: 130px;
            width: 130px;
        }

        #product-detail .line {
            width: 100px;
            height: 1px;
            background-color: black;
        }

        #product-detail td {
            list-style-type: disc;
        }

        #product-detail .thanhToan button {
            height: 40px;
        }

        #largeImage {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background-color: rgba(0, 0, 0, 0.8);
        }

        #largeImage img {
            width: 650px; /* hoặc height: 800px; */
            height: auto; /* hoặc width: auto; */

        }

        #product-detail .dataFlow {
            margin: auto;
            display: flex;
        }

        #product-detail .dataFlow .key {
            font-weight: bold;
            flex: 2;
            margin: 0;
        }

        #product-detail .dataFlow .value {
            flex: 4;
            margin: 0;
        }
    </style>
</head>
<body>
<%
    Product p = (Product) request.getAttribute("product");
%>
<jsp:include page="../../header.jsp"/>
<section id="product-detail" class="container mt-5 mb-5">
    <div class="container row mx-auto ">
        <div class="col-5 mx-4">
            <div class="img-product ">
                <img src="<%=p.getImg_main()%>"
                     alt="" onclick="displayIMage(this)">
            </div>
            <div class="d-flex">
                <div class="sub-img ms-2">
                    <img src="<%=p.getImg_extra1()%>"
                         alt="" onclick="displayIMage(this)">
                </div>
                <div class="sub-img ms-2">
                    <img src="<%=p.getImg_extra2()%>"
                         alt="" onclick="displayIMage(this)">
                </div>
                <div class="sub-img ms-2">
                    <img src="<%=p.getImg_extra3()%>"
                         alt="" onclick="displayIMage(this)">
                </div>
                <div class="sub-img ms-2 ">
                    <img src="<%=p.getImg_extra4()%>"
                         alt="" onclick="displayIMage(this)">

                </div>
            </div>

        </div>
        <div class="col-5 ms-3">
            <div class="name fs-3">
               <%=p.getName()%>
            </div>
            <div class="line"></div>

            <div class="gia fs-4 fw-bold my-4">
               <%=p.getPrice()%>
            </div>
            <div class="moTa">
                <p class="lh-base fw-bold">
                    Ruby là một trong những lựa chọn hàng đầu để chế tác thành trang sức. Ruby tự nhiên có màu sắc từ đỏ
                    hồng đến đỏ sẫm – màu sắc mang vẻ đẹp quyến rũ hoàn mỹ được phái đẹp yêu thích.
                </p>
                <ul>
                    <li>
                        <p class="fs-6">
                            Ruby tự nhiên 100%
                        </p>
                    </li>
                    <li>
                        <p class="fs-6">
                            Kiểm định và bảo hành trọn đời
                        </p>
                    </li>
                    <li>
                        <p class="fs-6">
                            Miễn phí vận chuyển toàn quốc
                        </p>
                    </li>
                    <li>
                        <p class="fs-6">
                            Ship đảm bảo Quốc tế
                        </p>
                    </li>
                </ul>

            </div>
            <div class="row thanhToan">
                <button class="col me-2 btn btn-outline-warning fw-bold">
                    them vao gio
                </button>
                <button class="col  btn btn-outline-warning fw-bold">
<%--                    <%=request.getContextPath()%>/order?id=<%=p.getId()%>&num=1" --%>
                    Mua
                </button>
            </div>
        </div>
    </div>
    <!-- thông số kỹ thuật -->
    <div class="row container mx-auto  mt-3">
        <p class="text-center fs-3">
            THÔNG SỐ KỸ THUẬT
        </p>
        <div class="row d-flex">
            <div class="col ">
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">value</p>
                </div>
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">Được kiểm định đầy đủ và viết phiếu bảo hành trọn đời về màu sắc và chất lượng</p>
                </div>
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">value</p>
                </div>
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">value</p>
                </div>
            </div>
            <div class="col">
                <div class="dataFlow m-3">
                    <p class="key"> key</p>
                    <p class="value">value</p>
                </div>
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">value</p>
                </div>
                <div class="dataFlow m-3">
                    <p class="key"> key aaaaaaa</p>
                    <p class="value">value</p>
                </div>

            </div>
        </div>
    </div>
    <!-- sản phẩm liên quan -->
    <jsp:include page="listRelatedProducts.jsp"/>

    </div>
</section>

<jsp:include page="../../footer.jsp"/>
<!-- ảnh được phóng to -->
<div id="largeImage" class="text-center"  onclick="hiddenIMage()">
    <img class="mt-5" src="" alt="Large Image" >
</div>
<script>
    var isClicked = "false";

    function displayIMage(element) {
        if (isClicked) {
            var imageURL = element.src;
            var largeImage = document.getElementById('largeImage');
            var imgElement = largeImage.querySelector('img');
            imgElement.src = imageURL;
            largeImage.style.display = 'block';
            isClicked = true
        }
    }
    function hiddenIMage(){
        var largeImage = document.getElementById('largeImage');
        largeImage.style.display = 'none';
    }
</script>
</body>
</html>
