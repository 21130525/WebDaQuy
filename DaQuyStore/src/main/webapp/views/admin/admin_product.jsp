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
    <title>Admin Product</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
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
                        <a href="<%=request.getContextPath()%>/views/admin/admin_summary.jsp" class="nav-link align-middle px-0">
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
                </ul>


                <hr>
            </div>
        </div>
        <div class="col py-3">
            <button type="button" class="btn btn-primary"><i class="fa-solid fa-plus"></i>Them moi</button>
            <button type="button" class="btn btn-primary" id="search"><i class="fa-solid fa-plus"></i>Tim kiem</button>
            <button type="button" class="btn btn-primary" id="convert" onclick="converttoExcel()">Xuat Excel</button>
            <select class="form-select" aria-label="Default select example">
                <option selected>Muc luc</option>
                <option value="1">Loại</option>
                <option value="2">Giá</option>
                <option value="3">Bán chạy</option>
                <option value="4">Giảm gia</option>
            </select>
            <table id="table_id" class="table table-striped">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Ten san pham</th>
                    <th>Gia</th>
                    <th>Tinh trang</th>
                    <th>Giam gia</th>
                    <th>Hot</th>
                    <th>Thao tac</th>
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
<script src="<%=request.getContextPath()%>/js/table2excel.js"></script>
<script>

    var $tbody = $('#body');

    $(document).ready(function () {
        $.ajax({
            url: '<%=request.getContextPath()%>/getproduct_admin',
            method: 'GET',
            dataType: 'JSON',
            success: function (response) {
                $.each(response, function (index, value) {
                    var $row = $('<tr>');
                    $.each(value, function (key, value_item_key) {
                        var $cell = $('<td>').text(value_item_key)
                        $row.append($cell)
                    });
                    // Thêm biểu tượng vào cuối mỗi dòng
                    var $icon1 = $('<i class="fa-solid fa-trash"></i>');
                    var $icon2 = $('<i class="fa-solid fa-wrench"></i>');
                    var $cell_with_icon = $('<td>').append($icon1).append($icon2);
                    $row.append($cell_with_icon);
                    $row.attr('id',value.id)
                    $icon1.click(function () {
                        $.ajax({
                            url: '<%=request.getContextPath()%>/deleteproduct_admin',
                            method: 'GET',
                            dataType: 'JSON',
                            data: {id:$row.prop('id') },
                            success: function(success) {
                                alert(success)
                               $row.remove()
                            },
                            error: function (mistake) {
                                alert(mistake)
                            }
                        })
                    })
                    $icon2.click(function (){
                        var productId = $row.prop('id');
                        window.location.href='<%=request.getContextPath()%>/updateproduct_admin?id=' + productId;
                    })
                    $tbody.append($row);
                    // $tbody.empty();
                });

            },
            error: function (error) {
                alert('Lay du lieu khong thanh cong')
            }
        });
    });

    $(document).ready(function () {
        $("#table_id").DataTable()
    })


    $(document).ready(function () {
        $('.dt-empty').hide();
    })
   
</script>
<script>
    function converttoExcel(){
        var table2excel = new Table2Excel();
        table2excel.export(document.querySelectorAll("table"));
    }

</script>
</html>
