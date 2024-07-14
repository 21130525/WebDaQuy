<%--
Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/3/2024
  Time: 00:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Product" %>
<%@ page import="service.manageUser.product.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="service.manageUser.order.OrderService" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <p class="border-bottom fs-2 text-center ">Sản Phẩm hot</p>
    <div class="col">
    <%
        ProductService ps = new ProductService();
        ArrayList<Product> lists = null;
        try {
            lists = ps.getProductPerPage(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    %>
    <%
        int index =0;
        for (Product p : lists) {
            index++;
            if(index==1 || index==5)   {
            %>
            <div class="row products">
            <%
                }
            %>
            <!-- product -->
            <div class="product col card border-0 d-flex align-items-center justify-content-center m-0 p-0">
                <div class="position-relative">
                    <a href="<%=request.getContextPath()%>/productDetail?id=<%=p.getId()%>">
                        <img class="card-img-top border-2" src="<%=p.getImg_main()%>" alt="anh">
                        <p class="d-inline position-absolute top-0 start-0 ms-2 mt-2 bg-danger text-white rounded fw-bold fs-6">
                            -12%</p>
                    </a>
                    <div class="d-flex justify-content-between border-0 position-absolute bottom-0 start-0" style="width: 100%;">
                        <form action="../order" method="Post">
                            <input id="inputNum" type="hidden" name="id" value="<%=p.getId()%>">
                            <input type="hidden" name="num" value="1">
                            <button id="btnBuy" class="btnBuy btn rounded-0 btn-d-none p-0 fw-bold" type="button">mua</button>
                        </form>
                        <a class="btn rounded-0 btn-d-none p-0 fw-bold" href="#">gio hang</a>
                    </div>
                </div>
                <div class="card-body pt-1">
                    <p class="card-text text-center d-block fs-5 m-0"><%=p.getName()%></p>
                    <p class="card-text text-center d-block fs-5 mt-1 text-info fw-bold"><%=OrderService.getInstance().formatNumber( p.getPrice())%></p>
                </div>
            </div>
            <%
             if(index==4 || index==8)   {
             %>
            </div>
            <%
                }
        }
    %>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script>
    $('.btnBuy').click(function (){
        var button = this
        Swal.fire({
            title: 'Nhập số lượng sản phẩm',
            input: 'number',
            inputValue: 1,
            showCancelButton: true,
            confirmButtonText: 'OK',
            cancelButtonText: 'Cancel',
            inputValidator: (value) => {
                if (!value || value < 1) {
                    return 'Số lượng không hợp lệ';
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                var newQuantity = parseInt(result.value);
                $('#inputNum').val(newQuantity);
                $(button).attr('type','submit');
                $(button).closest('form').submit();
            }
        });
    })
</script>
</section>
