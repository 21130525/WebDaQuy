<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/3/2024
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="model.Product" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--biểu tượng Material Icons:--%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet">
<link rel="stylesheet" href="../font/fontawesome-free-6.4.2/css/all.css">
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<header class="header">

    <div class="container">
        <div class="box">
            <%--logo--%>
            <div class="logo">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo" class="logo-img"/>
            </div>
            <nav class="navigation">
                <ul class="navigation-list">
                    <li class="navigation-item active">
                        <a href="<%=request.getContextPath()%>/views/index.jsp">Trang chủ</a>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/web/category/products.jsp">Sản phẩm</a>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/web/category/jewelrys.jsp">Trang sức</a>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/web/category/gemstone.jsp">Đá quý</a>
                        <i class="fa-solid fa-caret-down"></i>
                        <ul class="dropdown-gem">
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/spinel.jsp">Spinel</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/diamond.jsp">Kim cương</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/ruby.jsp">Ruby</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/peridot.jsp">Hổ phách</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/topaz.jsp">Topaz</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/aquamarine.jsp">Aquamarine</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/tourmarline.jsp">Tourmaline</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/jade.jsp">Jade</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/emerald.jsp">Emerald</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="<%=request.getContextPath()%>/views/web/category/garnet.jsp">Garnet</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/contact.jsp">Liên hệ</a>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/policy.jsp">Chính sách</a>
                    </li>
                    <li class="navigation-item">
                        <a href="<%=request.getContextPath()%>/views/about.jsp">Giới thiệu</a>
                    </li>
                </ul>
            </nav>
            <div class="header-btn">
                <ul class="header-list">
                    <li class="header-item header-search">
                        <form class="Search-form" role="search" action="../SearchController" method="get">
                            <input type="hidden" name="index" value="1">
                            <input
                                    type="search"
                                    name="txtSearch"
                                    class="search-input"
                                    placeholder="Tìm sản phẩm"
                                    autocomplete="off"
                            />
                            <button type="submit" class="header-search-btn">
                                <i class="fa-sharp fa-solid fa-magnifying-glass" style="color: #000000;"></i>
                            </button>
                        </form>
                    </li>
                    <li class="header-item header__drop">
                        <a href="${pageContext.request.contextPath}/views/web/cart/cart.jsp">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                    </li>
                    <li class="header-item sign-in">
                        <c:choose>
                            <c:when test="${empty sessionScope.username}">
                                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <c:out value="${sessionScope.username}"></c:out>
                                    </button>
                                    <div class="dropdown-content">
                                        <a href="${pageContext.request.contextPath}/views/login/changepassword.jsp">Đổi mật khẩu</a>
                                        <a href="${pageContext.request.contextPath}/views/login/profile.jsp">Hồ sơ</a>
                                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                        <a href="${pageContext.request.contextPath}/views/login/forgotPassword.jsp">Quên mật khẩu</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

