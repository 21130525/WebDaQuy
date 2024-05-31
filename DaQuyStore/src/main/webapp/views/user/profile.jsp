<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 20/3/2024
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang cá nhân</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css" type="text/css">

</head>
<body>
<% User u = (User) session.getAttribute("user");
if(u==null)
    u = new User();
%>
<jsp:include page="../header.jsp"/>
<section id="profile" class="mt-2">
    <div class="container ">
        <div class="row">
            <!-- menu bar -->
            <div class="col-3 ">
                <div class="row p-3">
                    <div class="avatar d-flex mb-2">
                        <div class="img-thrum">
                            <img src="<%=u.getAvatar()%>" alt="" class="rounded-5 border">
                        </div>
                        <div class=" d-flex  ms-3">
                            <p class="m-auto "><strong><%=u.getusername()%></strong></p>
                        </div>
                    </div>
                    <ul class="context-profile list-group list-group-flush">
                        <li class="list-group-item" style="background-color: #F5F5F5;">
                            <button id="btnProfile"
                                    class="btn actived">Hồ sơ của tôi
                            </button>
                        </li>
                        <li class="list-group-item" style="background-color: #F5F5F5;">
                            <button id="btnOrder"
                                    class="btn  ">Đơn đã mua
                            </button>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- main context -->
            <div class="col-9 border-start " style="background-color: white;">
                <!-- hồ sơ cá nhân -->
                <div id="ProfileInfo">
                    <div class="row border-bottom">
                        <Span class="fs-3">Hồ sơ Của tôi</Span>
                    </div>
                    <div>
                        <form action="../../profile" method="get">
                            <div class="row">
                                <div class="col-8">
                                    <!-- fill information -->
                                    <div class="">
                                        <div class="row my-2">
                                            <p class="col-4 text-end ">Tên đăng nhập:</p>
                                            <p class="col-8"><%=u.getusername()%>
                                            </p>
                                        </div>
<%--                                        Ho Ten--%>
                                        <div class="row my-2">
                                            <p class="col-4 text-end">Họ và tên:</p>
                                            <p class=" col-8"><% if (u.getFullName() == "" || u.getFullName() == null) { %>
                                                <input class=" w-100" type="text" name="fullName"
                                                       value="">
                                                <%} else { %>
                                                <%=u.getFullName()%>
                                                <%}%>
                                            </p>
                                        </div>
<%--                                        email--%>
                                        <div class="row my-2">
                                            <p class="col-4 text-end">Email:</p>
                                            <div class="col-8 d-flex">
                                                <p id="showEmail" class="w-75"><%=u.getEmail()%></p>
<%--                                                <button type="button" id="btnChangeEmail"--%>
<%--                                                        class="btn btn-link  p-0  ms-3" style="height: 24px;">--%>
<%--                                                    <i class="fas fa-edit"></i>--%>
<%--                                                </button>--%>
                                            </div>
                                        </div>
<%--                                        so dien thoai--%>
                                        <div class="row my-2">
                                            <p class="col-4 text-end">Số điện thoại:</p>
                                            <div class="col-8 d-flex">
                                                <p id="showPhoneNUmber" class="w-75"><%=u.getPhoneNumber()%></p>
                                                <input class="w-75" type="text" name="phoneNumber"
                                                       id="ipphoneNumber" value="" disabled>
                                                <button type="button" id="btnPhoneNumber" value="thay đổi"
                                                        class="btn btn-link  p-0 ms-3" style="height: 24px;">
                                                    <i class="fas fa-edit" id="iconPhoneNumber"></i></button>
                                            </div>
                                        </div>
<%--                                        dia chi--%>
                                        <div class="row my-2">
                                            <p class=" col-4 text-end">Địa chỉ:</p>
                                            <div class="col-8 d-flex">
                                                <p id="showAddress" class="w-75"><%=u.getAddress()%></p>
                                                <input type="text" class="w-75 " name="address" id="ipAddress"
                                                       value="" disabled>
                                                <button id="btnAddress" type="button" class="btn btn-link  p-0 ms-3"
                                                        style="height: 24px;"><i id="icAddress"
                                                                                 class="fas fa-edit"></i></button>
                                            </div>
                                        </div>
<%--                                        gioi tinh--%>
                                        <div class="row my-2">
                                            <p class=" col-4 text-end">Giới Tính:</p>
                                            <div class=" col-8 ">

                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label" for="inlineCheckbox1">Nữ</label>
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="inlineCheckbox1" value="NU"
                                                    <% if(u.getGender() =="nu"){%>
                                                        checked
                                                    <%}%>>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label"
                                                           for="inlineCheckbox2">Nam</label>
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="inlineCheckbox2" value="Nam"
                                                        <% if(u.getGender() =="nam"){%>
                                                           checked
                                                        <%}%>>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label"
                                                           for="inlineCheckbox3">khác</label>
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="inlineCheckbox3" value="Khac" <% if(u.getGender() =="khac"){%>
                                                           checked
                                                        <%}%>>
                                                </div>
                                            </div>
                                        </div>
<%--                                        ngay sinh--%>
                                        <div class="row my-2">
                                            <p class="col-4 text-end">Ngày Sinh:</p>
                                            <div class=" col-8 d-flex"><input type="date" name="birthday"
                                                                              id="birthday" value="<%=u.getBirthday()%>"></div>
                                        </div>

                                    </div>
                                    <div class="text-center mt-3">
                                        <button class="btn btn-outline-primary" type="submit">Lưu</button>
                                    </div>
                                </div>
                                <div class="col-4 border-start">
                                    <div class="text-center my-5">
                                        <img id="imgAvatar" src="<%=u.getAvatar()%>" alt="">
                                    </div>
                                    <div class="mb-3 text-center">
                                        <input class="form-control d-inline" type="file" id="formFile" name="avatar">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- sản phẩm đã mua -->
                <div id="Order" class=" " style="display: none;">
                    <!-- menu -->
                    <div class="row ">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <button id="nav-all" class="navButton nav-link active" aria-current="page"
                                        href="#">Tất cả
                                </button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-waitingPay" class="navButton nav-link" href="#">Chờ thanh
                                    toán
                                </button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-transport" class="navButton nav-link" href="#">Vận chuyển</button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-waitingForDelivery" class="navButton nav-link" href="#">chờ Giao
                                    Hàng
                                </button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-done" class="navButton nav-link" href="#">Hoàn thành</button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-cancelled" class="navButton nav-link" href="#">Đã hủy</button>
                            </li>
                            <li class="nav-item">
                                <button id="nav-returnProduct" class="navButton nav-link" href="#">Trả hàng/Hoàn
                                    tiền
                                </button>
                            </li>
                        </ul>
                    </div>
                    <!-- thanh tìm kiếm -->
                    <div>
                        <form action="/SearchProduct">
                            <nav class="mt-3 bg-body-tertiary">
                                <div class="container">
                                    <div class="d-flex" role="search">
                                        <input class="form-control me-2 w-100" type="search"
                                               placeholder="Bạn có thể tìm kiếm sản phẩm theo tên hoặc id "
                                               aria-label="Search" name="searchInput">
                                        <button class="btn btn-outline-success" type="submit">Search</button>
                                    </div>
                                </div>
                            </nav>
                        </form>
                    </div>
                    <!-- danh sách sản phẩmphẩm -->
                    <div class="mt-3 ">
                        <!-- 1 san pham -->
                        <div class="product my-3 mt-4  border-top">
                            <div class="text-end border-bottom m-3">
                                Đơn hàng đã hoàn thành
                            </div>

                            <!-- list product -->
                            <div class="row product ">
                                <div class="col-2 mx-auto ">
                                    <img class=" "
                                         src="../src/main/webapp/img/gemstone/spinel/Vien-Spinel-sac-cobalt-sieu-VIP-175ct-IRSI65-231117500000.jpg"
                                         alt="" style="height: 100px; width: 100px;">
                                </div>
                                <div class="col-7 my-3">
                                    <p class="mb-3"><Strong>Tên sản phẩm</Strong></p>
                                    <span class="align-text-bottom">
                                            <p class="">số lượng: 1</p>
                                        </span>

                                </div>
                                <p class="col-2 text-end mx-auto ">100 000 đ </p>
                                <p class="border mx-3 w-75 mx-auto"></p>
                            </div>

                            <!-- thanh tien -->
                            <div>
                                <p class="text-end mx-4"><Strong> Thành tiền:</Strong> 10000 đ</p>
                            </div>
                        </div>

                        <!-- 1 san pham -->
                        <div class="product my-3 mt-4  border-top">
                            <div class="text-end border-bottom m-3">
                                Đơn hàng đã hoàn thành
                            </div>

                            <!-- list product -->
                            <div class="row product ">
                                <div class="col-2 mx-auto ">
                                    <img class=" "
                                         src="../src/main/webapp/img/gemstone/spinel/Vien-Spinel-sac-cobalt-sieu-VIP-175ct-IRSI65-231117500000.jpg"
                                         alt="" style="height: 100px; width: 100px;">
                                </div>
                                <div class="col-7 my-3">
                                    <p class="mb-3"><Strong>Tên sản phẩm</Strong></p>
                                    <span class="align-text-bottom">
                                            <p class="">số lượng: 1</p>
                                        </span>

                                </div>
                                <p class="col-2 text-end mx-auto ">100 000 đ </p>
                                <p class="border mx-3 w-75 mx-auto"></p>
                            </div>

                            <!-- thanh tien -->
                            <div>
                                <p class="text-end mx-4"><Strong> Thành tiền:</Strong> 10000 đ</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center text-dark">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"/>

<script>
    // Lấy tham chiếu đến các phần tử button và div
    const BtnProfile = document.getElementById('btnProfile');
    const btnOrder = document.getElementById('btnOrder');
    const div1 = document.getElementById('ProfileInfo');
    const div2 = document.getElementById('Order');

    // Xử lý sự kiện khi nhấn vào button để vô hiệu hóa div tương ứng
    BtnProfile.addEventListener('click', function () {
        BtnProfile.classList.add("actived")
        btnOrder.classList.remove("actived")

        div1.style.display = "block";
        div2.style.display = "none";

    });

    btnOrder.addEventListener('click', function () {
        BtnProfile.classList.remove("actived")
        btnOrder.classList.add("actived")

        div1.style.display = "none";
        div2.style.display = "inline";
    });

    // thay đổi số điện thoại
    const btnPhoneNumber = document.getElementById('btnPhoneNumber');
    btnPhoneNumber.addEventListener('click', function () {
        const showPhoneNUmber = document.getElementById('showPhoneNUmber');
        const ipphoneNumber = document.getElementById('ipphoneNumber');
        const icon = document.getElementById("iconPhoneNumber");
        if (icon.classList.contains("fa-edit")) {

            showPhoneNUmber.style.display = "none";
            ipphoneNumber.value = showPhoneNUmber.textContent;

            ipphoneNumber.style.display = "block";
            ipphoneNumber.disabled = false;

            // Thiết lập giá trị mới cho button
            icon.classList.remove("fa-edit");
            icon.classList.add("fa-check");

        } else {
            if (isValidPhoneNumber(ipphoneNumber.value)) {
                showPhoneNUmber.style.display = "block";
                showPhoneNUmber.textContent = ipphoneNumber.value;

                ipphoneNumber.style.display = "none";
                ipphoneNumber.disabled = false;

                // Thiết lập giá trị mới cho button
                icon.classList.remove("fa-check");
                icon.classList.add("fa-edit");
            }
        }
    });

    function isValidPhoneNumber(phone) {
        // Biểu thức chính quy kiểm tra xem chuỗi chỉ chứa ký tự chữ cái hay không
        const pattern = /^(\+\d{1,3}[- ]?)?\d{10}$/;

        if (pattern.test(phone)) {

            return true;
        } else {
            alert('số điện thoại không hợp lệ.');
            return false;
        }
    }

    // thay đổi địa chỉ
    const btnAddress = document.getElementById('btnAddress');
    btnAddress.addEventListener('click', function () {
        const showAddress = document.getElementById('showAddress');
        const ipAddress = document.getElementById('ipAddress');
        const icon = document.getElementById("icAddress");
        if (icon.classList.contains("fa-edit")) {

            showAddress.style.display = "none";
            ipAddress.value = showAddress.textContent;

            ipAddress.style.display = "block";
            ipAddress.disabled = false;

            // Thiết lập giá trị mới cho button
            icon.classList.remove("fa-edit");
            icon.classList.add("fa-check");
        } else {
            showAddress.style.display = "block";
            showAddress.textContent = ipAddress.value;

            ipAddress.style.display = "none";
            ipAddress.disabled = false;

            // Thiết lập giá trị mới cho button
            icon.classList.remove("fa-check");
            icon.classList.add("fa-edit");
        }
    });


    // Lắng nghe sự kiện onchange của input file
    document.getElementById('formFile').onchange = function (event) {
        // Lấy tập tin được chọn
        const file = event.target.files[0];
        if (file && file.type.startsWith('image/')) {
            // Tạo đường dẫn cho hình ảnh
            const imageUrl = URL.createObjectURL(file);

            // Hiển thị hình ảnh trong phần tử img
            const imgPreview = document.getElementById('imgAvatar');
            imgPreview.src = imageUrl;
            imgPreview.style.display = 'block';
        } else {
            // Nếu tập tin không phải là hình ảnh, hiển thị thông báo lỗi
            alert('Vui lòng chọn một tập tin hình ảnh.');
        }
    };
    // lấy cùng lúc nhiều button
    const navButton = document.querySelectorAll('.navButton');
    // thêm sự kiên cho các button
    navButton.forEach(button => {
        // xóa active
        button.addEventListener('click', function () {
            navButton.forEach(btn => {
                btn.classList.remove('active');
            });
            // thêm active
            this.classList.add('active')
        })
    });

</script>
</body>
</html>
