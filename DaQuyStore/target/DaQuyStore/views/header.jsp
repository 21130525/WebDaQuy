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
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

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
        font-size: larger;
    }

    header .bg-search {
        background-color: #E2C16C;
    }

    .logo-img {
        width: 50px;
        height: 50px;
        float: left;
        margin-left: 20px;
        border-radius: 15px;
    }


</style>

<header class="container-fluid border-bottom border-dark">
    <nav class="navbar navbar-expand-lg bg-light ">
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
                               href="${pageContext.request.contextPath}/views/web/cart/cart.jsp">
                                <i class="fa-solid fa-cart-shopping"></i>
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
                        <button class="btn btn-outline-primary border-0 ">
                            <strong>
                                <c:out value="${sessionScope.username}"></c:out>
                            </strong>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
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
    </nav>


</header>


<%--&lt;%&ndash;biểu tượng Material Icons:&ndash;%&gt;--%>
<%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>

<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">--%>
<%--<link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"--%>
<%--      rel="stylesheet">--%>
<%--<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"--%>
<%--      rel="stylesheet">--%>
<%--<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"--%>
<%--      rel="stylesheet">--%>
<%--<link rel="stylesheet" href="../font/fontawesome-free-6.4.2/css/all.css">--%>
<%--<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">--%>
<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--&lt;%&ndash;&lt;%&ndash;bootrap&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--<header class="header">--%>

<%--    <div class="container">--%>
<%--        <div class="box">--%>
<%--            &lt;%&ndash;logo&ndash;%&gt;--%>
<%--            <div class="logo">--%>
<%--                <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo" class="logo-img"/>--%>
<%--            </div>--%>
<%--            <nav class="navigation">--%>
<%--                <ul class="navigation-list">--%>
<%--                    <li class="navigation-item active">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/index.jsp">Trang chủ</a>--%>
<%--                    </li>--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/web/category/products.jsp">Sản phẩm</a>--%>
<%--                    </li>--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/web/category/jewelrys.jsp">Trang sức</a>--%>
<%--                    </li>--%>
<%--                    &lt;%&ndash;dropdown&ndash;%&gt;--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/web/category/gemstone.jsp"> </a>--%>
<%--                        <i class="fa-solid fa-caret-down"></i>--%>
<%--                        <ul class="dropdown-gem">--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/spinel.jsp">Spinel</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/diamond.jsp">Kim cương</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/ruby.jsp">Ruby</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/peridot.jsp">Hổ phách</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/topaz.jsp">Topaz</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/aquamarine.jsp">Aquamarine</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/tourmarline.jsp">Tourmaline</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/jade.jsp">Jade</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/emerald.jsp">Emerald</a>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown-item">--%>
<%--                                <a href="<%=request.getContextPath()%>/views/web/category/garnet.jsp">Garnet</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/contact.jsp">Liên hệ</a>--%>
<%--                    </li>--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/policy.jsp">Chính sách</a>--%>
<%--                    </li>--%>
<%--                    <li class="navigation-item">--%>
<%--                        <a href="<%=request.getContextPath()%>/views/about.jsp">Giới thiệu</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--            <div class="header-btn">--%>
<%--                <ul class="header-list">--%>
<%--                    <li class="header-item header-search">--%>
<%--                        <form class="Search-form" role="search" action="../SearchController" method="get">--%>
<%--                            <input type="hidden" name="index" value="1">--%>
<%--                            <input--%>
<%--                                    type="search"--%>
<%--                                    name="txtSearch"--%>
<%--                                    class="search-input"--%>
<%--                                    placeholder="Tìm sản phẩm"--%>
<%--                                    autocomplete="off"--%>
<%--                            />--%>
<%--                            <button type="submit" class="header-search-btn">--%>
<%--                                <i class="fa-sharp fa-solid fa-magnifying-glass" style="color: #000000;"></i>--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </li>--%>
<%--                    <li class="header-item header__drop">--%>
<%--                        <a href="${pageContext.request.contextPath}/views/web/cart/cart.jsp">--%>
<%--                            <i class="fa-solid fa-cart-shopping"></i>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="header-item sign-in">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${empty sessionScope.username}">--%>
<%--                                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <div class="dropdown">--%>
<%--                                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--                                        <c:out value="${sessionScope.username}"></c:out>--%>
<%--                                    </button>--%>
<%--                                    <div class="dropdown-content">--%>
<%--                                        <a href="${pageContext.request.contextPath}/views/login/changepassword.jsp">Đổi mật khẩu</a>--%>
<%--                                        <a href="${pageContext.request.contextPath}/views/login/profile.jsp">Hồ sơ</a>--%>
<%--                                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>--%>
<%--                                        <a href="${pageContext.request.contextPath}/views/login/forgotPassword.jsp">Quên mật khẩu</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>

