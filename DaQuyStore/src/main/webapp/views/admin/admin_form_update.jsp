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
    <title>Cập nhật sản phẩm</title>
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
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

    #table_id_wrapper {
        overflow-x: auto;
    }
</style>
<jsp:include page="admin_header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Danh mục </span>
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
                                class="ms-1 d-none d-sm-inline">Thêm sản phẩm</span>
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
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_inventory.jsp"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-warehouse"></i><span class="ms-1 d-none d-sm-inline">Quản lí số lượng tồn kho</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_log.jsp"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-note-sticky"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí log</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_image.jsp"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-image"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí ảnh</span>
                        </a>
                    </li>
                    <% if(session.getAttribute("user")!=null){%>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin_logout"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-door-open"></i><span
                                class="ms-1 d-none d-sm-inline">Đăng xuất</span>
                        </a>
                    </li><%}%>
                </ul>

                <hr>
            </div>
        </div>
        <div class="col py-3" style="width: 70%">
            <!--form chỉnh sửa thông tin sản phẩm-->
            <h2 style="color: #A80F23">Vui lòng không thay đổi ID của sản phẩm!Nếu thay đổi và báo lỗi,hãy liên hệ để
                giải quyết</h2>
            <h2>Thông tin sản phẩm</h2>
            <form method="post" action="${pageContext.request.contextPath}/updateproduct_admin"
                  enctype="multipart/form-data" id="form">
                <div class="form-group">
                    <label for="id">Mã sản phẩm:</label>
                    <input type="text" class="form-control" id="id" placeholder="STT Sản phẩm" name="id"
                           value="<%= session.getAttribute("id")%>">
                </div>
                <div class="form-group">
                    <label for="productName">Tên sản phẩm:</label>
                    <input type="text" class="form-control" id="productName" placeholder="Nhập tên sản phẩm"
                           name="productName">
                </div>
                <div class="form-group">
                    <label for="productPrice">Giá tiền:</label>
                    <input type="text" class="form-control" id="productPrice" placeholder="Nhập giá tiền" name="price">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-main">Ảnh sản phẩm-chính:</label>
                    <input type="file" class="form-control-file" id="productImages-main" name="image-main">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-1">Ảnh sản phẩm-1:</label>
                    <input type="file" class="form-control-file" id="productImages-1" name="image-1">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-2">Ảnh sản phẩm-2:</label>
                    <input type="file" class="form-control-file" id="productImages-2" name="image-2">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-3">Ảnh sản phẩm-3:</label>
                    <input type="file" class="form-control-file" id="productImages-3" name="image-3">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-4">Ảnh sản phẩm-4:</label>
                    <input type="file" class="form-control-file" id="productImages-4" name="image-4">
                </div>
                <div class="form-group">
                    <label>Tình trạng </label>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="having" name="status" value="Còn hàng">
                        <label class="form-check-label" for="having">Còn hàng</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="not_having" name="status" value="Hết hàng">
                        <label class="form-check-label" for="not_having">Hết hàng</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check-inline">
                        <input type="number" class="form-check-input" id="sale" name="sale" placeholder="Nhập giảm giá"
                               style="width: 200px;height:20px">
                        <label class="form-check-label" for="sale">Giảm giá</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            Tình trạng hot:0 là không có,1 là có
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="hot" name="hot" value="1">
                        <label class="form-check-label" for="hot">1</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="no_hot" name="hot" value="0">
                        <label class="form-check-label" for="hot">0</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="productDescription">Nội dung:</label>
                    <textarea class="form-control" id="productDescription" rows="3" placeholder="Nhập nội dung"
                              name="description"></textarea>
                </div>
                <div class="form-group">
                    <label for="productType">Select Product Type:</label>
                    <select class="form-control" id="productType" name="productType">
                        <option value="Ruby">Ruby</option>
                        <option value="Aquamarine">Aquamarine</option>
                        <option value="Tourmaline">Tourmaline</option>
                        <option value="Spinel">Spinel</option>
                        <option value="Sapphire">Sapphire</option>
                        <option value="Zircon">Zircon</option>
                        <option value="Peridot">Peridot</option>
                        <option value="Garnet">Garnet</option>
                        <option value="Ngọc lục bảo">Ngọc lục bảo</option>
                        <option value="Topaz">Topaz</option>
                    </select>
                </div>

                <!-- Thêm thêm radio button tương tự cho các loại sản phẩm khác -->

                <button type="submit" class="btn btn-primary mb-3">Submit</button>
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

    $(document).ready(function () {
        $('.dt-empty').hide()
    })
</script>
</html>
