<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/9/2024
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quan li don hang</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<style>
    .button-status {
        border-color: #3498db;
        color: #fff;

        box-shadow: 0 0 40px 40px #3498db inset, 0 0 0 0 #3498db;
        transition: all 150ms ease-in-out;
        width: 150px;
        height: 50px;
    }

    .button-status:hover {
        box-shadow: 0 0 10px 0 #3498db inset, 0 0 10px 4px #3498db;
    }

</style>
<jsp:include page="admin_header.jsp"></jsp:include>
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
                            <i class="fa-solid fa-chart-simple"></i> <span
                                class="ms-1 d-none d-sm-inline">Doanh thu</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_product.jsp"
                           class="nav-link px-0 align-middle" id="menu_0">
                            <i class="fa-brands fa-product-hunt"></i> <span class="ms-1 d-none d-sm-inline">Quản lí sản phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_form_upload_product.jsp"
                           class="nav-link px-0 align-middle" id="menu_1">
                            <i class="fa-solid fa-upload"></i> <span
                                class="ms-1 d-none d-sm-inline">Them san pham</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_order.jsp"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-gift"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí đơn hàng</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_user.jsp"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-user"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí người dùng</span>
                        </a>
                    </li>
                </ul>

                <hr>
            </div>
        </div>
        <div class="col py-3">
            <form action="https://www.youtube.com/watch?v=vKuHQRTS20U" method="post">
                <button class="button-status text-black" name="btn" value="Cho xac nhan">Cho xac nhan</button>
                <button class="button-status text-black" name="btn" value="Cho giao">Cho giao</button>
                <button class="button-status text-black" name="btn" value="Dang giao">Dang giao</button>
                <button class="button-status text-black" name="btn">Da giao</button>
            </form>


            <table id="table_id" class="table table-striped">
                <thead>
                <tr>
                    <th>Tai khoan</th>
                    <th>Mat khau</th>
                    <th>Ho ten</th>
                    <th>Gioi tinh</th>
                    <th>Ngay sinh</th>
                    <th>Email</th>
                    <th>SDT</th>
                    <th>Dia chi</th>
                    <th>Avatar</th>
                    <th>Ngay tao</th>
                    <th>Ngay cap nhat</th>
                    <th>Vai tro</th>
                    <th>Trang thai</th>
                </tr>
                </thead>
                <tbody id="body">
                </tbody>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $("#submenu_1").hide();
        $("#menu_1").click(function () {
            $("#submenu_1").slideToggle();
        })
    })
    $(document).ready(function () {
        $("#table_id").DataTable();
    })
    $(document).ready(function () {
        $("#dt-search-0").attr('name', 'search')
    })
    $(document).ready(function () {
        $("#btn").click(function () {
            $.ajax({
                url: '',
                method: 'GET',
                dataType: 'JSON',
                data: $('#dt-search-0').value,
                success: function (response) {

                },
                error: function (error) {

                }
            })
        })
    })
    $(document).ready(function () {
        $('.dt-empty').hide()
    })
</script>
</html>
