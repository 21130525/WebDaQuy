<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 4/25/2024
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quan li lien he</title>
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
                        <a href="#"
                           class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-address-book"></i> <span
                                class="ms-1 d-none d-sm-inline">Quản lí lien he</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/admin/admin_inventory.jsp" class="nav-link px-0 align-middle">
                            <i class="fa-solid fa-warehouse"></i><span class="ms-1 d-none d-sm-inline">Quản lí số lượng tồn kho</span>
                        </a>
                    </li>
                </ul>


                <hr>
            </div>
        </div>
        <div class="col py-3">
            <button type="button" class="btn btn-primary"><i class="fa-solid fa-plus"></i>Them moi</button>
            <button type="button" class="btn btn-primary" id="search"><i class="fa-solid fa-plus"></i>Tim kiem</button>
            <select class="form-select" aria-label="Default select example">
                <option selected>Muc luc</option>
                <option value="1">Loại</option>
                <option value="2">Giá</option>
                <option value="3">Bán chạy</option>
                <option value="4">Giảm gia</option>
            </select>
            <table id="table_id" class="table table-striped table-bordered">
                <thead >
                <tr >
                    <th class="bg-primary text-white">STT</th>
                    <th class="bg-primary text-white">Ten san pham</th>
                    <th class="bg-primary text-white">Gia</th>
                    <th class="bg-primary text-white">Tinh trang</th>
                    <th class="bg-primary text-white">Giam gia</th>
                    <th class="bg-primary text-white">Hot</th>
                    <th class="bg-primary text-white">Color</th>
                    <th class="bg-primary text-white">Thao tac</th>
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
    $(document).ready(function (){
        $('#table_id').DataTable()
    })
    var $tbody=$('#body')
    $(document).ready(function(){
        $.ajax({
            url:'#',
            method:'Get',
            dataType:'Json',
            success:function (response){
                $.each(response,function(index,value){
                    var $raw=$('<tr>')
                    $.each(value,function(index,key){
                        var $cell=$('<td>').text(key)
                        $row.append($cell)
                    })
                    var $delete=$('<i class="fa-solid fa-trash"></i>')
                    var $edit=$('<i class="fa-solid fa-gear"></i>')
                    var $action=$('<td>').append($delete,$edit)
                    $raw.append($action)
                    $tbody.append($row)
                })
            },
            error:function(error){
                alert('Load du lieu khong thanh cong')
            }
        })
    })
    $('th').mouseenter(function (){
        $('th').fadeIn(3000)
    })
</script>
</html>
