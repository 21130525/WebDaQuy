<%@ page import="model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.User" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/26/2024
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Thanh toan</title>

</head>
<body>
<%
    Map<Product, Integer> listOrder = new HashMap<>();
    double total =0;
    if(request.getSession(true).getAttribute("listOrder") != null){
        listOrder = (Map<Product, Integer>) request.getSession(true).getAttribute("listOrder");
    }

    if(request.getAttribute("totalPrice")!=null){
        total = (double) request.getAttribute("totalPrice");
    }
    User user = null;
    if(request.getSession(true).getAttribute("user") != null){
        user = (User) request.getSession(true).getAttribute("user");
    }
%>
<jsp:include page="../../header.jsp"/>
<section class=" " style="background-color: #eee;">

    <div class="container py-5">

        <div class="row d-flex justify-content-center align-items-center ">
            <div class="col card">
                    <div class="card-body p-4 row">
                        <div class="col-lg-6">
                            <div class="text-center ">
                                <h1 class="">Thanh Toán</h1>
                            </div>
                            <div class="accordion m-1" id="accordionPanelsStayOpenExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header m-2">
                                        Thông Tin Khách Hàng
                                    </h2>
                                    <div id="information_customer" class="accordion-collapse collapse show">
                                        <div class="accordion-body">
                                            <!-- thong tin khach hang -->
                                            <div>
                                                <div class="d-flex">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio"
                                                               name="inlineRadioOptions" id="inlineRadio1"
                                                               value="option1">
                                                        <label class="form-check-label" for="inlineRadio1">anh <span
                                                                class="text-danger">*</span></label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio"
                                                               name="inlineRadioOptions" id="inlineRadio2"
                                                               value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">chi<span
                                                                class="text-danger">*</span></label>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="nameCustommer" class="form-label">Họ và Tên:
                                                            </label>
                                                            <input type="text" class="form-control"
                                                                   id="nameCustommer"
                                                                   placeholder="Họ và Tên (Bắt Buộc)"
                                                            <%
                                                                if(user != null){
                                                            %>
                                                                value="<%=user.getFullName()%>"
                                                             <%
                                                                }
                                                             %>
                                                            >
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email:</label>
                                                            <input type="text" class="form-control" id="email"
                                                                   placeholder="email"
                                                                <%
                                                                if(user != null){
                                                            %>
                                                                   value="<%=user.getEmail()%>"
                                                                <%
                                                                }
                                                             %>
                                                            >
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="phoneNumber" class="form-label">Số Điện
                                                                Thoại</label>
                                                            <input type="text" class="form-control" id="phoneNumber"
                                                                   placeholder="Số Điện Thoại (Bắt Buộc)"
                                                                <%
                                                                if(user != null){
                                                                     if(user.getPhoneNumber()!=null)
                                                            %>
                                                                   value="<%=user.getPhoneNumber()%>"
                                                                <%
                                                                }
                                                             %>
                                                            >
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="birthday" class="form-label">Ngày
                                                                sinh</label>
                                                            <input type="text" class="form-control" id="birthday"
                                                                   placeholder="Ngày Sinh (dd-mm-yyyy)"
                                                                <%
                                                                if(user != null){
                                                                    if(user.getBirthday()!=null)
                                                            %>
                                                                   value="<%=user.getBirthday()%>"
                                                                <%
                                                                }
                                                             %>
                                                            >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center my-2" id="containerbtnConfirmInfCostommer">
                                    <button class=" btn  btn-primary" type="button" value="true"
                                            data-bs-toggle="collapse" data-bs-target="#information_customer"
                                            aria-expanded="true" aria-controls="information_customer"
                                            id="btnConfirmInfCustommer">
                                        Tiếp tục
                                    </button>
                                </div>
                                <!-- Thong tin giao hang -->
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        Hình Thức Nhận Hàng
                                    </h2>
                                    <!-- button lua chon loai giao hang   -->
                                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show">
                                        <div class="accordion-body">
                                            <div class="text-center">
                                                <button class="col-5 mx-auto" id="btnGiaoHangTanNoi">
                                                    <p class="m-0"> <strong> Giao Hàng Tận Nơi</strong></p>
                                                    <p class="m-0">giao hàng toàn quốc</p>
                                                </button>
                                                <button class="col-5 mx-auto" id="btnNhanTaiCuaHang">
                                                    <p class="m-0"><strong>Nhận Tại Cửa Hàng</strong></p>
                                                    <p class="m-0">Trả tiền lúc nhận hàng</p>
                                                </button>
                                            </div>
                                            <div>
                                                <!-- giao hang tan noi -->
                                                <div class="row mt-4" id="GiaoHangTanNoi">
                                                    <form class="">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-outline form-white mb-4 row">
                                                                    <select id="typeName"
                                                                            class="form-control form-control-lg">
                                                                        <option value="">Chọn Tỉnh/Thành phố
                                                                        </option>
                                                                        <option value="1">Tỉnh/Thành phố 1</option>
                                                                        <option value="2">Tỉnh/Thành phố 2</option>
                                                                        <!-- Thêm các option khác tùy theo nhu cầu -->
                                                                    </select>
                                                                </div>
                                                                <div class="form-outline form-white mb-4  row ">
                                                                    <select id="typeText_ward"
                                                                            class="form-control form-control-lg"
                                                                            onclick="checkInputNameWard()">
                                                                        <option value="">Chọn Phường/Xã</option>
                                                                        <option value="1">Phường/Xã 1</option>
                                                                        <option value="2">Phường/Xã 2</option>
                                                                        <!-- Thêm các option khác tùy theo nhu cầu -->
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-outline form-white row mb-4 ">
                                                                    <select id="typeText_district"
                                                                            class="form-control form-control-lg "
                                                                            onclick="checkInputNameDistrict()">
                                                                        <option value="">Chọn Quận/Huyện</option>
                                                                        <option value="1">Quận/Huyện 1</option>
                                                                        <option value="2">Quận/Huyện 2</option>
                                                                        <!-- Thêm các option khác tùy theo nhu cầu -->
                                                                    </select>
                                                                </div>

                                                                <div class="form-outline form-white row mb-4">
                                                                    <div class="form-outline form-white">
                                                                        <input type="text" id="typeExp"
                                                                               class="form-control form-control-lg"
                                                                               placeholder="Địa chỉ cụ thể" size="8"
                                                                               id="exp" minlength="7" maxlength="7" />

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-4">
                                                            <div class="form-outline form-white">
                                                                <input type="text" id="typeText_3"
                                                                       class="form-control form-control-lg"
                                                                       placeholder="Ghi Chú" size="1" minlength="10"
                                                                       maxlength="10" />

                                                            </div>
                                                        </div>
                                                        <input type="checkbox" style="width: 20px; height: 20px;">
                                                        <span class="fs-4">Tôi chấp nhận chương tinh của trang web
                                                            </span>
                                                    </form>


                                                </div>
                                                <!-- nhan tai cua hang -->
                                                <div class="row mt-4 d-none" id="NhanTaiCuaHang">
                                                    <p class="fs-3 fw-normal"> <strong>địa chỉ của hàng:</strong>
                                                        khu phố A phường Linh Trung Thành phố Thủ Đức</p>
                                                    <div class="row mb-4">
                                                        <div class="form-outline form-white">
                                                            <input type="text" id="typeText_2"
                                                                   class="form-control form-control-lg"
                                                                   placeholder="Ghi Chú" size="1" minlength="10"
                                                                   maxlength="10" />

                                                        </div>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" style="width: 20px; height: 20px;">
                                                        <span class="fs-4 ms-4">xác nhận lấy hàng ở cửa hàng </span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h5 class="mb-3"><a href="<%=request.getContextPath()%>/views/index.jsp" class="text-body"><i
                                    class="fas fa-long-arrow-alt-left me-2"></i> tiếp tục mua hàng</a></h5>
                            <hr>

                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <p class="mb-1">Thông Tin Giỏ hàng</p>
                                </div>
                            </div>
                            <!--  danh sach cac san pham -->
                            <div class="card mb-3">
                                <div class="card-body">
                                    <% for(Map.Entry<Product,Integer> entry : listOrder.entrySet()){%>
                                    <%--product--%>
                                    <% Product p = entry.getKey(); %>
                                    <div class="d-flex justify-content-between">

                                        <div class="d-flex flex-row align-items-center">
                                            <div>
                                                <img src="<%=p.getImg_main()%>"
                                                     class="img-fluid rounded-3" alt="Shopping item"
                                                     style="width: 80px;">
                                            </div>
                                            <div class="ms-3" style="width: 200px">
                                                <h6><%=p.getName()%></h6>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center">
                                            <div style="width: 50px;">
                                                <%--So luong--%>
                                                <h5 class="fw-normal mb-0"><%=entry.getValue()%></h5>
                                            </div>
                                            <div style="width: 120px;">
                                                <%--Gia --%>
                                                <h5 class="mb-0"><%=entry.getValue()*p.getPrice()+""%></h5>
                                            </div>
                                            <a href="#" style="color: #cecece;"><i
                                                    class="fas fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                                    <%--end product--%>

                                    <%
                                    }
                                    %>


                                </div>

                            </div>
                            <hr class="my-4">

                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Tổng số Tiền</p>
                                <p class="mb-2"><%=total +""%> Đ</p>
                            </div>

                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Phí ship</p>
                                <p class="mb-2">20.000 Đ</p>
                            </div>

                            <div class="d-flex justify-content-between mb-4">
                                <p class="mb-2">Thanh Toán</p>
                                <p class="mb-2"><%=total-20000 +""%> Đ</p>
                            </div>
                            <form action="checkOut" method="post"></form>
                            <button type="button" class="btn btn-info btn-block btn-lg" id="btn">
                                <div class="d-flex justify-content-between">
                                    <span>Đặt Hàng <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                </div>
                            </button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../../footer.jsp"/>
</body>
<script>
    const input_name_city = document.getElementById("typeName");
    const input_name_district = document.getElementById("typeText_district");
    const input_name_ward = document.getElementById("typeText_ward");

    function checkInputName() {
        if (input_name_city.value === "") {
            alert("Bạn phải chọn thành phố");
        }
    }

    function checkInputNameDistrict() {
        if (input_name_city.value === "") {
            alert("Bạn phải chọn thành pho trước");
        }
    }
    //ham nay kiem tra gia tri trong o input phuong va lay du lieu tu servlet ve
    function checkInputNameWard() {
        if (input_name_city.value === "" || input_name_district.value === "") {
            alert("Bạn phải chọn theo thứ tự là thành phố trước, sau đó là quận/huyện");
        } else {
            $(document).ready(
                function () {
                    $.ajax({
                            url: '/getshippingfee',
                            method: 'GET',
                            dataType: 'Json',
                            data: {
                                city: input_name_city.value,
                                district: input_name_district.value,
                                ward: input_name_district.value
                            },
                            success: function (response) {
                                let announced_order = document.getElementById("announced-order")
                                announced_order.innerHTML += response
                            },
                            error: function (error) {
                                console.log('Lay du lieu khong thanh cong')
                            }
                        }
                    )
                }
            )
        }
    }
    $('#btnConfirmInfCustommer').click(function () {
        if ($($(this)).val() === "true") {

            $('#containerbtnConfirmInfCostommer').removeClass('text-center');
            $('#containerbtnConfirmInfCostommer').addClass('text-end');
            $(this).addClass('btn-secondary')
            $(this).removeClass('btn-primary')
            $(this).text('Chỉnh sửa');
            $(this).val("false");
        } else {
            $('#containerbtnConfirmInfCostommer').removeClass('text-end');
            $('#containerbtnConfirmInfCostommer').addClass('text-center');
            $(this).addClass('btn-primary')
            $(this).removeClass('btn-secondary')

            $(this).text('Tiếp tục');
            $(this).val("true");
        }
    });


    $('#btnGiaoHangTanNoi').click(function () {
        $('#GiaoHangTanNoi').removeClass('d-none');
        $('#NhanTaiCuaHang').addClass('d-none')

    });
    $('#btnNhanTaiCuaHang').click(function () {
        $('#GiaoHangTanNoi').addClass('d-none');
        $('#NhanTaiCuaHang').removeClass('d-none')

    });
</script>
</html>