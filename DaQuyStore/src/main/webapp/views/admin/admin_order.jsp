<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Quản lí đơn hàng</title>
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
        <div class="col py-3" style="width: 70%;">

            <button class="button-status text-black" name="btn" value="Chờ xác nhận" id="waiting">Chờ xác nhận</button>
            <button class="button-status text-black" name="btn" value="Cho giao" id="waiting-giving">Đang chờ giao</button>
            <button class="button-status text-black" name="btn" value="Đang giao" id="giving">Đang giao</button>
            <button class="button-status text-black" name="btn" id="gived" value="Đã giao">Đã giao</button>
            <button class="button-status text-black" name="btn" id="canceled" value="Hủy">Hủy</button>
            <button type="button" class="btn btn-primary" id="convert" onclick="converttoExcel()">Xuất Excel</button>

            <table id="table_id" class="table table-striped">
                <thead>
                <tr>
                    <th>Thông tin đơn hàng</th>
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
    var $tbody = $('#body')
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
</script>
<script>
    //nút bấm cho trạng thái chờ xác nhận
    $(document).ready(function () {

        $('#waiting').click(function () {



            $.ajax({
                url: '<%=request.getContextPath()%>/getorder_waiting',
                method: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    $.each(response, function (index, value) {
                        var $row = $('<tr>').attr('id', value.id);
                        $.each(value, function (key, value_item) {
                            var $cell = $('<td>').text(value_item);
                            $row.append($cell);
                        });

                        <%--var $delete = $('<i class="fa-solid fa-trash"></i>').click(function () {--%>
                        <%--    $.ajax({--%>
                        <%--        url: '<%=request.getContextPath()%>/deleteorder',--%>
                        <%--        method: 'GET',--%>
                        <%--        data: {id: $row.prop('id')},--%>
                        <%--        dataType: 'JSON',--%>
                        <%--        success: function (response) {--%>
                        <%--            alert('Xóa thành công');--%>
                        <%--            $row.hide();--%>
                        <%--        },--%>
                        <%--        error: function (error) {--%>
                        <%--            alert('Xóa không thành công');--%>
                        <%--        }--%>
                        <%--    });--%>
                        <%--});--%>

                        var $edit = $('<i class="fa-solid fa-wrench"></i>').click(function () {
                            Swal.fire({
                                title: "Bạn có chắc chắn không?",
                                text: "Bạn sẽ không thể khôi phục được!",
                                icon: "warning",
                                input: 'select',
                                inputOptions: {
                                    waiting: 'chờ xác nhận',
                                    cancelled:'hủy',
                                    waiting_giving:'đang chờ giao',
                                    giving:'đang giao',
                                    gived:'đã giao'
                                },
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, delete it!"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    const selected_value = result.value;
                                        let id = $row.prop('id');
                                        $.ajax({
                                            url: "<%=request.getContextPath()%>/updateorder",
                                            data: {id: id, select: selected_value},
                                            dataType: 'json',
                                            type: "POST",
                                            success: res => {
                                                console.log(res);
                                                Swal.fire({
                                                    title: "Đã cập nhật!",
                                                    text: "Cập nhật thành công.",
                                                    icon: "success"
                                                });
                                            }
                                        });
                                    }

                            });
                        });

                        var $actionCell = $('<td>').append($edit);
                        $row.append($actionCell);
                        $tbody.append($row);
                    });
                },
                error: function (error) {
                    alert('Lỗi khi lấy dữ liệu');
                }
            });
        });
    });
</script>
<script>
    //nút bấm cho trạng thái đang giao
    $(document).ready(function () {
        $('#giving').click(function () {
            var $spinner = $('<div class="spinner"><div class="d-flex justify-content-center"><div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div></div></div>');
            $('body').append($spinner);

            function showSpinner() {
                $spinner.show();
            }

            function hideSpinner() {
                $spinner.hide();
            }

            showSpinner();
            $tbody.empty();
            $.ajax({
                url: '<%=request.getContextPath()%>/getorder_giving',
                method: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    hideSpinner()
                    $.each(response, function (index, value) {
                        var $row = $('<tr>');
                        $row.attr('id', value.id);
                        $.each(value, function (key, value_item) {
                            var $cell = $('<td>').text(value_item);
                            $row.append($cell);
                        });
                        // var $delete = $('<i class="fa-solid fa-trash"></i>');
                        var $edit = $('<i class="fa-solid fa-wrench"></i>');
                        var $cell = $('<td>');
                        $cell.append( $edit);
                        $row.append($cell);
                        <%--$delete.click(function () {--%>
                        <%--    $.ajax({--%>
                        <%--        url: '<%=request.getContextPath()%>/deleteorder',--%>
                        <%--        method: 'GET',--%>
                        <%--        data: {id: $row.prop('id')},--%>
                        <%--        dataType: 'JSON',--%>
                        <%--        success: function (response) {--%>
                        <%--            alert('Xóa thành công');--%>
                        <%--            $row.hide();--%>
                        <%--        },--%>
                        <%--        error: function (error) {--%>
                        <%--            alert('Xóa không thành công');--%>
                        <%--        }--%>
                        <%--    });--%>
                        <%--});--%>
                        $edit.click(function () {
                            Swal.fire({
                                title: "Bạn có chắc chắn không?",
                                text: "Bạn sẽ không thể khôi phục được!",
                                icon: "warning",
                                input: 'select',
                                inputOptions: {
                                    waiting: 'chờ xác nhận',
                                    cancelled:'hủy',
                                    waiting_giving:'đang chờ giao',
                                    giving:'đang giao',
                                    gived:'đã giao'
                                },
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, delete it!"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    const selected_value = result.value;
                                    let id = $row.prop('id');
                                    $.ajax({
                                        url: "<%=request.getContextPath()%>/updateorder",
                                        data: {id: id, select: selected_value},
                                        dataType: 'json',
                                        type: "POST",
                                        success: res => {
                                            console.log(res);
                                            Swal.fire({
                                                title: "Đã cập nhật!",
                                                text: "Cập nhật thành công.",
                                                icon: "success"
                                            });
                                        }
                                    });
                                }

                            });
                        });
                        $tbody.append($row);
                    });
                },
                error: function (error) {
                    alert('Lấy dữ liệu không thành công');
                }
            });
        });
    })

</script>
<script>
    $(document).ready(function () {
        $('.dt-empty').hide()
    })
</script>
<script>
    //nút bấm cho trạng thái đã giao
    $(document).ready(function () {
        $('#gived').click(function () {

            $tbody.empty();
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
                url: '<%=request.getContextPath()%>/getorder_gived',
                method: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    hideSpinner()
                    $.each(response, function (index, value) {
                        var $row = $('<tr>');
                        $row.attr('id', value.id);
                        $.each(value, function (key, value_item) {
                            var $cell = $('<td>').text(value_item);
                            $row.append($cell);
                        });
                        $tbody.append($row);
                    });
                },
                error: function (error) {
                    alert('Lấy dữ liệu không thành công');
                }
            });
        });
    })
</script>
<script>
    //nút bấm cho trạng thái đã hủy
    $(document).ready(function () {
        $('#canceled').click(function () {
            $tbody.empty();
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
                url: '<%=request.getContextPath()%>/getorder_canceled',
                method: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    hideSpinner()
                    $.each(response, function (index, value) {
                        var $row = $('<tr>');
                        $row.attr('id', value.id);
                        $.each(value, function (key, value_item) {
                            var $cell = $('<td>').text(value_item);
                            $row.append($cell);
                        });
                        $tbody.append($row);
                    });
                },
                error: function (error) {
                    alert('Lấy dữ liệu không thành công');
                }
            });
        });
    })
</script>
<script>
    //nút bấm cho trạng thái chờ giao
    $(document).ready(function () {
        $('#waiting-giving').click(function () {
            $tbody.empty();
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
                url: '<%=request.getContextPath()%>/getorder_waitinggiving',
                method: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    hideSpinner()
                    $.each(response, function (index, value) {
                        var $row = $('<tr>');
                        $row.attr('id', value.id);
                        $.each(value, function (key, value_item) {
                            var $cell = $('<td>').text(value_item);
                            $row.append($cell);
                        });
                        // var $delete = $('<i class="fa-solid fa-trash"></i>');
                        var $edit = $('<i class="fa-solid fa-wrench"></i>');
                        var $cell = $('<td>');
                        $cell.append($edit);
                        $row.append($cell);
                        <%--$delete.click(function () {--%>
                        <%--    $.ajax({--%>
                        <%--        url: '<%=request.getContextPath()%>/deleteorder',--%>
                        <%--        method: 'GET',--%>
                        <%--        data: {id: $row.prop('id')},--%>
                        <%--        dataType: 'JSON',--%>
                        <%--        success: function (response) {--%>
                        <%--            alert('Xóa thành công');--%>
                        <%--            $row.hide();--%>
                        <%--        },--%>
                        <%--        error: function (error) {--%>
                        <%--            alert('Xóa không thành công');--%>
                        <%--        }--%>
                        <%--    });--%>
                        <%--});--%>
                        $edit.click(function () {
                            Swal.fire({
                                title: "Bạn có chắc chắn không?",
                                text: "Bạn sẽ không thể khôi phục được!",
                                icon: "warning",
                                input: 'select',
                                inputOptions: {
                                    waiting: 'chờ xác nhận',
                                    cancelled:'hủy',
                                    waiting_giving:'đang chờ giao',
                                    giving:'đang giao',
                                    gived:'đã giao'

                                },
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, delete it!"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    const selected_value = result.value;
                                    let id = $row.prop('id');
                                    $.ajax({
                                        url: "<%=request.getContextPath()%>/updateorder",
                                        data: {id: id, select: selected_value},
                                        dataType: 'json',
                                        type: "POST",
                                        success: res => {
                                            console.log(res);
                                            Swal.fire({
                                                title: "Đã cập nhật!",
                                                text: "Cập nhật thành công.",
                                                icon: "success"
                                            });
                                        }
                                    });
                                }

                            });
                        });
                        $tbody.append($row);
                    });
                },
                error: function (error) {
                    alert('Lấy dữ liệu không thành công');
                }
            });
        });
    })
</script>
<script>
    function converttoExcel(){
        var table2excel = new Table2Excel();
        table2excel.export(document.querySelectorAll("table"));
    }
</script>
</html>
