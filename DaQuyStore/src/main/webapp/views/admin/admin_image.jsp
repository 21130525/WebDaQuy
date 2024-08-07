<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 6/19/2024
  Time: 9:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lí ảnh sản phẩm</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<style>
    .spinner {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    #table_id_wrapper{
        overflow-x: auto;
    }
</style>
<body>
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
                        <a href="<%=request.getContextPath()%>/views/admin/admin_summary.jsp"
                           class="nav-link align-middle px-0">
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
            <button type="button" class="btn btn-primary" id="convert" onclick="converttoExcel()">Xuất Excel</button>

            <table id="table_id" class="table table-striped">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Ảnh 1</th>
                    <th>Ảnh 2</th>
                    <th>Ảnh 3</th>
                    <th>Ảnh 4</th>
                    <th>Ảnh 5</th>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<%=request.getContextPath()%>/js/table2excel.js"></script>


<script>
    $(document).ready(function () {
        $("#table_id").DataTable()
    });
    var $tbody = $('#body')
    $(document).ready(function () {
        var $spinner = $('<div class="spinner"><div class="d-flex justify-content-center"><div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div></div></div>');
        $('body').append($spinner);

        function showSpinner() {
            $spinner.show();
        }

        function hideSpinner() {
            $spinner.hide();
        }

        showSpinner();
        $.ajax({
            url: '<%=request.getContextPath()%>/getimage',
            method: 'GET',
            dataType: 'JSON',
            success: function (response) {
                hideSpinner();
                $.each(response, function (key, value) {
                    var $row = $('<tr>');
                    $row.attr('id', value.id);

                    $.each(value, function (key, value_item_key) {
                        if (key == 'img_main') {
                            var imgmain = $('<img>', {
                                src: value_item_key, // Đường dẫn tới ảnh của bạn
                                alt: 'Ảnh chính', // Miêu tả ảnh
                                width: '20%', // Điều chỉnh kích thước ảnh
                                height: '20%'
                            });
                            var $cell = $('<td>').append(imgmain);
                            $row.append($cell);
                        } else if (key === 'img_1') {
                            var img1 = $('<img>', {
                                src: value_item_key, // Đường dẫn tới ảnh của bạn
                                alt: 'Ảnh 1', // Miêu tả ảnh
                                width: '20%', // Điều chỉnh kích thước ảnh
                                height: '20%'
                            });
                            var $cell = $('<td>').append(img1);
                            $row.append($cell);
                        } else if (key === 'img_2') {
                            var img2 = $('<img>', {
                                src: value_item_key, // Đường dẫn tới ảnh của bạn
                                alt: 'Ảnh 2', // Miêu tả ảnh
                                width: '20%', // Điều chỉnh kích thước ảnh
                                height: '20%'
                            });
                            var $cell = $('<td>').append(img2);
                            $row.append($cell);
                        } else if (key === 'img_3') {
                            var img3 = $('<img>', {
                                src: value_item_key, // Đường dẫn tới ảnh của bạn
                                alt: 'Ảnh 3', // Miêu tả ảnh
                                width: '20%', // Điều chỉnh kích thước ảnh
                                height: '20%'
                            });
                            var $cell = $('<td>').append(img3);
                            $row.append($cell);
                        } else if (key === 'img_4') {
                            var img4 = $('<img>', {
                                src: value_item_key, // Đường dẫn tới ảnh của bạn
                                alt: 'Ảnh 4', // Miêu tả ảnh
                                width: '20%', // Điều chỉnh kích thước ảnh
                                height: '20%'
                            });
                            var $cell = $('<td>').append(img4);
                            $row.append($cell);
                        }else{
                            var $cell = $('<td>').text(value_item_key)
                            $row.append($cell);
                        }
                    });
                    $tbody.append($row); // Thêm hàng vào tbody của bảng có id là table_id
                });
            },
            error: function (error) {
                hideSpinner();
                alert('Không thể tải dữ liệu người dùng');
            }
        });
    });


    $(document).ready(function () {
        $('.dt-empty').hide()
    })

</script>
<script>
    function converttoExcel(){
        var table2excel = new Table2Excel();
        table2excel.export(document.querySelectorAll("table"));
    }

</script>
</html>
