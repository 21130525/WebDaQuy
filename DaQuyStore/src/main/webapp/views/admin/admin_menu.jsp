<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/9/2024
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="admin_menu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">DashBoard</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start">
                    <li class="nav-item">
                        <a href="#" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Doanh thu</span>
                        </a>
                    </li>
                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle" id="menu_1">
                            <i class="fs-4 bi-speedometer2"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí sản phẩm</span> </a>
                        <ul class="collapse show nav flex-column ms-1" data-bs-parent="#menu" id="submenu_1">
                            <li class="w-100">
                                <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Giá</span> 1 </a>--%>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Giá</span> </a>
                            </li>
                            <li class="w-100">
                                <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Loại</span> 2 </a>--%>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Loại</span> </a>
                            </li>
                            <li class="w-100">
                                <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Loại</span> 2 </a>--%>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Ban chay</span> </a>
                            </li>
                            <li class="w-100">
                                <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Loại</span> 2 </a>--%>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Ban het</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Quản lí đơn hàng</span></a>
                    </li>
<%--                    <li>--%>
<%--                                                <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">--%>
<%--                                                    <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Bootstrap</span></a>--%>
<%--                        <ul class="collapse nav flex-column ms-1" data-bs-parent="#menu">--%>
<%--                            <li class="w-100">--%>
<%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 1</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 2</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">Quản lí người dùng</span>
                        </a>
                        <%--                        <ul class="collapse nav flex-column ms-1" data-bs-parent="#menu">--%>
                        <%--                            <li class="w-100">--%>
                        <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 1</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 2</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 3</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 4</a>--%>
                        <%--                            </li>--%>
                        <%--                        </ul>--%>
                        <%--                    </li>--%>
                        <%--                    <li>--%>
                        <%--                        <a href="#" class="nav-link px-0 align-middle">--%>
                        <%--                            <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Customers</span> </a>--%>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                       id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30"
                             class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">Admin</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <%--                        <li><a class="dropdown-item" href="#">New project...</a></li>--%>
                        <%--                        <li><a class="dropdown-item" href="#">Settings</a></li>--%>
                        <%--                        <li><a class="dropdown-item" href="#">Profile</a></li>--%>
                        <%--                        <li>--%>
                        <%--                            <hr class="dropdown-divider">--%>
                        <%--                        </li>--%>
                        <li><a class="dropdown-item" href="#">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col py-3">
            <table>

            </table>
        </div>
    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $("#submenu_1").hide();
        $("#menu_1").click(function () {
            $("#submenu_1").slideToggle();
        })
    })
</script>
</html>
