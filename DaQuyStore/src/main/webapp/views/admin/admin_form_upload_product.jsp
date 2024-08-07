<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 4/22/2024
  Time: 7:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<style>
    /* CSS để trang trí các ô nhập liệu (inputs) */
    /* CSS để trang trí các nhãn (labels) */
    label {
        font-weight: bold; /* Đặt định dạng đậm cho văn bản nhãn */
        color: #333; /* Màu văn bản */
        margin-bottom: 5px; /* Khoảng cách dưới của mỗi nhãn */
        display: block; /* Hiển thị mỗi nhãn trên một dòng riêng biệt */
    }

    .form-control-file {
        border: 1px solid #ccc;
        padding: 5px;
        margin-bottom: 10px;
        display: block;
        width: 100%;
    }
    #table_id_wrapper{
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
                            <i class="fa-solid fa-upload"></i> <span class="ms-1 d-none d-sm-inline">Thêm sản phẩm</span>
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
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_inventory.jsp" class="nav-link px-0 align-middle">
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
            <h2>Thông tin sản phẩm</h2>
            <form method="post" action="${pageContext.request.contextPath}/addproduct_admin" enctype="multipart/form-data" id="form" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="productName">Tên sản phẩm:</label>
                    <input type="text" class="form-control" id="productName" placeholder="Nhập tên sản phẩm" name="productName">
                </div>
                <div class="form-group">
                    <label for="productPrice">Giá tiền:</label>
                    <input type="text" class="form-control" id="productPrice" placeholder="Nhập giá tiền" name="price">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-main">Ảnh sản phẩm-chính:</label>
                    <input type="file" class="form-control-file" id="productImages-main"  name="image-main">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-1">Ảnh sản phẩm-1:</label>
                    <input type="file" class="form-control-file" id="productImages-1"  name="image-1">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-2">Ảnh sản phẩm-2:</label>
                    <input type="file" class="form-control-file" id="productImages-2"  name="image-2">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-3">Ảnh sản phẩm-3:</label>
                    <input type="file" class="form-control-file" id="productImages-3"  name="image-3">
                </div>
                <div class="form-group mb-3">
                    <label for="productImages-4">Ảnh sản phẩm-4:</label>
                    <input type="file" class="form-control-file" id="productImages-4"  name="image-4">
                </div>

                <div class="form-group">
                    <label for="number_import">Số lượng</label>
                    <input type="number" name="number_import" id="number_import" placeholder="Nhập số lượng thêm vào">
                </div>
                <div class="form-group">
                    <label for="color">Màu sắc</label>
                    <input type="text" name="color" id="color" placeholder="Nhập thông tin về màu sắc:ví dụ:xanh,đỏ,tím,vàng,..." size="100">
                </div>
                <div class="form-group">
                    <label for="weight">Trọng lượng</label>
                    <input type="text" name="weight" id="weight" placeholder="Nhập thông tin về trọng lượng">
                </div>
                <div class="form-group">
                    <label for="size">Kích cỡ </label>
                    <input type="text" name="size" id="size" placeholder="Nhập thông tin về kích cỡ theo cú pháp sau:vd:0.38ct*4.72ct*4.85ct" size="100">
                </div>
                <div class="form-group">
                    <label for="opacity">Độ trong</label>
                    <input type="text" name="opacity" id="opacity" placeholder="Nhập thông tin về độ trong suốt">
                </div>
                <div class="form-group">
                    <label for="cutting_form">Giác cắt </label>
                    <input type="text" name="cutting_form" id="cutting_form" placeholder="Nhập thông tin giác cắt ">
                </div>
                <div class="form-group">
                    <label for="status">Tình trạng </label>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="status" name="status" value="Còn hàng">
                        <label class="form-check-label" for="status">Còn hàng</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="productDescription">Nội dung:</label>
                    <textarea class="form-control" id="productDescription" rows="3" placeholder="Nhập nội dung" name="description"></textarea>
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

    $(document).ready(function (){
        $('.dt-empty').hide()
    })
    $(document).ready(function (event){
        $('#form').submit(function (){
            if(isNaN($('#number_import').val())||$('#number_import').val()===''){
                event.preventDefault();
                alert('Thong tin ban nhap vao o so luong phai la so khong phai chu !!!')
            }
        })
    })
</script>
</html>
