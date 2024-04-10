<%@ page import="model.User" %>

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/3/2024
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="model.Product" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- link bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- font owesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/font/fontawesome-free-6.4.2/css/all.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet">
<!-- style -->
<style>
    header {
        height: 66px;
        font-size: large;
    }

    header .bg-search {
        background-color: #E2C16C;
    }

    header .logo-img {
        width: 50px;
        height: 50px;
        float: left;
        margin-left: 20px;
        border-radius: 15px;
    }



</style>

<header class="container-fluid border-bottom border-dark navbar navbar-expand-lg bg-light">
        <div class="container-fluid ms-3 me-3">
            <!-- logo -->
            <a class="navbar-brand" href="#">
                <img src="<%=request.getContextPath()%>/img/logo.png" alt="Logo" class="logo-img"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- list menu -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page"
                           href="<%=request.getContextPath()%>/views/index.jsp">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Trang sức</a>
                    </li>
                    <!-- dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Đá quý
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Spinel</a></li>
                            <li><a class="dropdown-item" href="#">Kim cương</a></li>
                            <li><a class="dropdown-item" href="#">Ruby</a></li>
                            <li><a class="dropdown-item" href="#">Hổ phách</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Liên hệ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/views/policy.jsp">Chính
                            sách</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/views/about.jsp">Giới
                            thiệu</a>
                    </li>
                </ul>
                <!-- search -->
                <form class="d-flex" role="search" action="../SearchController" method="get">
                    <input class="form-control me-2 bg-search" aria-label="Search"
                           type="search"
                           name="txtSearch"
                           placeholder="Tìm sản phẩm"
                           autocomplete="off"
                    >
                    <button class="btn btn-outline-success" type="submit">Tìm</button>
                </form>
                <ul class="d-flex ">
                    <!-- cart -->
                    <li class="nav-item  pt-2" style="list-style-type: none;">
                        <button class="btn btn-outline-primary border-0">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/views/shoppingcart.jsp">
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="cart-count">0</span>
                            </a>
                        </button>
                    </li>


                    <!-- login -->
                    <% if (session.getAttribute("username") == null) {%>
                    <li class="nav-item ms-3 me-3 pt-2" style="list-style-type: none;">
                        <button class="btn btn-outline-primary border-0 ">
                            <strong>
                                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/login">Đăng
                                    nhập</a>
                            </strong>
                        </button>
                    </li>
                    <%} else {%>

                    <%-- login fined--%>
                    <li class="nav-item dropdown ms-3 me-3 pt-2" style="list-style-type: none;">
                        <button class="btn  border-1  nav-link dropdown-toggle"   data-bs-toggle="dropdown" aria-expanded="false">
                            <strong>
                               <% String user = (String) session.getAttribute("username");

                               %>
                                <%=user%>
                            </strong>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item "
                                   href="${pageContext.request.contextPath}/views/login/changepassword.jsp">Đổi mật
                                khẩu</a></li>
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/views/login/profile.jsp">Hồ sơ</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>


</header>

