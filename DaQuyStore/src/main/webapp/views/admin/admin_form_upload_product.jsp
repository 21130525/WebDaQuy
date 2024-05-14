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
    <title>Them san pham</title>
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
            <form method="post" action="${pageContext.request.contextPath}/addproduct_admin" enctype="multipart/form-data">
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
                <div class="form-group mb-3">
                    <label for="link-productImages-main">Link ảnh sản phẩm-chính:</label>
                    <input type="text" class="form-control" id="link-productImages-main" placeholder="Nhập đường link ảnh" name="link-image-main">
                </div>
                <div class="form-group mb-3">
                    <label for="link-productImages-1">Link ảnh sản phẩm-ảnh 1:</label>
                    <input type="text" class="form-control" id="link-productImages-1" placeholder="Nhập đường link ảnh" name="link-image-1">
                </div>
                <div class="form-group mb-3">
                    <label for="link-productImages-2">Link ảnh sản phẩm-ảnh 2:</label>
                    <input type="text" class="form-control" id="link-productImages-2" placeholder="Nhập đường link ảnh" name="link-image-2">
                </div>
                <div class="form-group mb-3">
                    <label for="link-productImages-3">Link ảnh sản phẩm-ảnh 3:</label>
                    <input type="text" class="form-control" id="link-productImages-3" placeholder="Nhập đường link ảnh" name="link-image-3">
                </div>
                <div class="form-group mb-3">
                    <label for="link-productImages-4">Link ảnh sản phẩm-ảnh 4:</label>
                    <input type="text" class="form-control" id="link-productImages-4" placeholder="Nhập đường link ảnh" name="link-image-4">
                </div>

                <div class="form-group">
                    <label for="productDescription">Nội dung:</label>
                    <textarea class="form-control" id="productDescription" rows="3" placeholder="Nhập nội dung" name="description"></textarea>
                </div>
                <div class="form-group">
                    <label>Loại sản phẩm:</label><br>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="ruby" name="productType">
                        <label class="form-check-label" for="ruby">Ruby</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="aquamarine" name="productType">
                        <label class="form-check-label" for="aquamarine">Aquamarine</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="tourmaline" name="productType">
                        <label class="form-check-label" for="tourmaline">Tourmaline</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="spinel" name="productType">
                        <label class="form-check-label" for="spinel">Spinel</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="sapphire" name="productType">
                        <label class="form-check-label" for="sapphire">Sapphire</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="zircon" name="productType">
                        <label class="form-check-label" for="zircon">Zircon</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="peridot" name="productType">
                        <label class="form-check-label" for="peridot">Peridot</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="garnet" name="productType">
                        <label class="form-check-label" for="garnet">Garnet</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="peace" name="productType">
                        <label class="form-check-label" for="peace">Ngọc trai</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="emerald" name="productType">
                        <label class="form-check-label" for="emerald">Lục bảo</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="diamond" name="productType">
                        <label class="form-check-label" for="diamond">Kim cương</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="citrine" name="productType">
                        <label class="form-check-label" for="citrine">Citrine</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="beryl" name="productType">
                        <label class="form-check-label" for="beryl">Beryl</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="amethyst" name="productType">
                        <label class="form-check-label" for="amethyst">Amethyst</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" class="form-check-input" id="topaz" name="productType">
                        <label class="form-check-label" for="topaz">Topaz</label>
                    </div>
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
</script>
</html>