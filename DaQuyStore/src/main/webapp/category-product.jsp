<%@ page import="model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .categories .image {
            position: relative;
            padding-bottom: 50px; /* Đảm bảo có khoảng trống để chứa các nút */
        }

        .categories .image img {
            display: block;
            margin: 0 auto;
            transition: opacity 0.3s ease;
        }

        .categories .name-product,
        .categories .price-product {
            text-align: center;
            margin-top: 10px;
        }

        .categories .button-overlay {
            display: none; /* Ẩn các nút ban đầu */
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.8); /* Nền trắng mờ */
            bottom: 0;
        }

        .categories .image:hover .button-overlay {
            display: flex; /* Hiển thị các nút khi hover */
        }

        .categories .btn {
            flex: 1;
            text-align: center;
            margin: 0 5px;
        }

        .categories .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .categories .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .categories .btn-primary:hover,
        .categories .btn-secondary:hover {
            background-color: #0056b3; /* Màu khi hover */
        }
    </style>
</head>
<body>
<section class="categories">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <%-- <c:forEach var=""></c:forEach> --%>
            <%
                List<Product> list = (List<Product>) request.getAttribute("list");
                for (Product product : list) {
            %>
            <div class="col-6 col-md-2 image position-relative">
                <a href="<%=request.getContextPath()%>/productDetail?id=<%=product.getId()%>">
                    <img class="category-image" src="<%=product.getImg_main()%>" alt="Product Image" style="height: 80px; width: 80px;">
                </a>
                <div class="name-product">
                    <p><%= product.getName()%></p>
                </div>
                <div class="price-product">
                    <p><%=product.getPrice()%></p>
                </div>
                <div class="button-overlay d-flex justify-content-between border-0 position-absolute bottom-0 start-0 w-100">
                    <a class="btn btn-primary rounded-0 p-0 fw-bold" href="checkout.jsp">mua</a>
                    <a class="btn btn-secondary rounded-0 p-0 fw-bold" href="#">giỏ hàng</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<!-- JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
