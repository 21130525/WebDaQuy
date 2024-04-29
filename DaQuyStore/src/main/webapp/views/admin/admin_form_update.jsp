<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 4/23/2024
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cap nhat san pham</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        margin-top: 10px;
    }
    .btn-primary:hover {
        background-color: #0069d9;
        border-color: #0062cc;
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
                            <i class="fa-solid fa-chart-simple"></i> <span class="ms-1 d-none d-sm-inline">Doanh thu</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_product.jsp" class="nav-link px-0 align-middle" id="menu_0">
                            <i class="fa-brands fa-product-hunt"></i> <span class="ms-1 d-none d-sm-inline">Quản lí sản phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_form_upload_product.jsp" class="nav-link px-0 align-middle" id="menu_1">
                            <i class="fa-solid fa-upload"></i> <span class="ms-1 d-none d-sm-inline">Them san pham</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_order.jsp" class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-gift"></i> <span class="ms-1 d-none d-sm-inline">Quản lí đơn hàng</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_user.jsp" class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-user"></i> <span class="ms-1 d-none d-sm-inline">Quản lí người dùng</span>
                        </a>

                    </li>
                </ul>

                <hr>

            </div>
        </div>
        <div class="col py-3">
            <h2>Thông tin sản phẩm</h2>
            <form>
                <div class="form-group">
                    <label for="productName">Tên sản phẩm:</label>
                    <input type="text" class="form-control" id="productName" placeholder="Nhập tên sản phẩm">
                </div>
                <div class="form-group">
                    <label for="price">Giá tiền:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">VNĐ</span>
                        </div>
                        <input type="text" class="form-control" id="price" placeholder="Nhập giá tiền">
                    </div>
                </div>
                <div class="form-group">
                    <label for="status">Tình trạng:</label>
                    <select class="form-control" id="status">
                        <option>Đang còn hàng</option>
                        <option>Hết hàng</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="discount">Giảm giá (%):</label>
                    <input type="text" class="form-control" id="discount" placeholder="Nhập giảm giá (nếu có)">
                </div>
                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" id="hot">
                    <label class="form-check-label" for="hot">Sản phẩm hot</label>
                </div>
                <div class="form-group">
                    <label for="color">Màu sắc:</label>
                    <input type="text" class="form-control" id="color" placeholder="Nhập màu sắc">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Lưu thông tin</button>
            </form>


            </form>
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
        $("#table_id").DataTable();
    })

    $(document).ready(function (){
        $('.dt-empty').hide()
    })
</script>
</html>
