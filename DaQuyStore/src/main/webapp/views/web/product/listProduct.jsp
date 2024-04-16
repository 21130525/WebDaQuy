<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/3/2024
  Time: 00:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- link bootstrap -->
<style>
    .list-product {
        width: 1080px;
    }

    .list-product .product {
        width: 200px;
    }

    .list-product .product img {
        height: 200px;
        width: 200px;
    }

    .btn-d-none {
        font-size: 13px;
        height: 30px;
        width: 80px;
        text-align: center;
        line-height: 30px;
        /* Căn giữa theo chiều dọc */
        display: none;
        background-color: #A80F23;
        color: #ffffff;
        animation: moveUp 1s ease forwards;
    }

    .product:hover .btn-d-none {
        display: block;
    }

    .product .btn-d-none:hover {
        border-width: 2px;
        border-style: dashed;
        border-color: black;
        color: #A80F23;
        background-color: #ffffff;
    }

    @keyframes moveUp {
        0% {
            opacity: 0;
            transform: translateY(100%)
        }

        100% {
            opacity: 1;
            transform: translateY(0)
        }
    }
</style>
<section class="list-product container mt-3">
    <p class="border-bottom ">danh muc</p>
    <div class="col">
        <!-- row 1 -->
        <div class="row">
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
        </div>

        <!-- row 1 -->
        <div class="row">
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
            <!-- product -->
            <div class="product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 ">
                <div class="position-relative">
                    <a href="">
                        <img class="card-img-top border-2 "
                             src="../src/main/webapp/img/gemstone/ruby/Vien-Ruby-facet-Luc-Yen-063ct-IRRF152-231006300000.jpg"
                             alt="anh">
                        <p
                                class="d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0 "
                         style="width: 100%;">
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">mua</a>
                        <a class="btn  rounded-0  btn-d-none p-0 fw-bold " href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5  m-0 ">kim cuong den</p>
                    <p class="card-text text-center d-block fs-6 mt-1">1212000 đ</p>
                </div>
            </div>
        </div>


    </div>
    </div>
</section>
