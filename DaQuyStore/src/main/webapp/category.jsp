<%@ page import="model.User" %>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/DaQuyStore_war/css/cate.css">
    <style>
        .cate {
            background-color: #f0f8ff; /* Màu nền tổng thể */
            padding: 20px;
        }

        .categories .container-fluid {
            background-color: #ffffff; /* Màu nền bên trong */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .image-container {
            text-align: center;
            margin: 15px 0;
            background-color: #ffeb3b; /* Màu nền của vùng chứa hình ảnh và chữ */
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .image-container:hover {
            background-color: #fff176; /* Màu nền khi hover */
        }

        .image-container a {
            text-decoration: none;
            color: #333; /* Màu chữ ban đầu */
            transition: color 0.3s ease;
        }

        .image-container a:hover {
            color: #007bff; /* Màu chữ khi hover */
        }

        .category-image {
            width: 100%;
            height: auto;
            border-radius: 8px; /* Hình ảnh bo tròn */
            transition: transform 0.3s ease;
        }

        .category-image:hover {
            transform: scale(1.05); /* Tăng kích thước khi hover */
        }

        .category-name {
            font-size: 1.1em;
            font-weight: bold; /* Làm cho chữ đậm hơn */
            margin-top: 10px;
            color: #555;
            transition: color 0.3s ease, font-weight 0.3s ease;
        }

        .category-name:hover {
            color: #007bff; /* Màu chữ khi hover */
            font-weight: bolder; /* Làm cho chữ đậm hơn khi hover */
        }
    </style>
</head>
<%User user = (User) request.getSession().getAttribute("user");%>
<body>
<div class="page-header">
    <jsp:include page="${request.getContextPath()}/views/header.jsp"/>
</div>
<div class="cate">
        <section class="categories">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <% CategoryDao dao = new CategoryDao();
                        List<Category> list = null;
                        list = dao.listCategory();
                        for (Category category : list) {
                    %>
                    <div class="col-6 col-md-2 image-container" >
                        <a href="<%=request.getContextPath()%>/ProductByCategory?name=<%=category.getCategory_name()%>">
                            <img class="category-image" src="<%=category.getImg()%>">
                            <p class="category-name"><%= category.getCategory_name()%>
                            </p>
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
        </section>
</div>
<%--<div class="page-footer">--%>
<%--    <jsp:include page="${request.getContextPath()}/views/footer.jsp"/>--%>
<%--</div>--%>
<!-- JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
