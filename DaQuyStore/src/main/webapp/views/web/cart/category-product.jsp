<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="connector.DAOConnection" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
    ProductDao dao = new ProductDao(DAOConnection.getConnection());
    List<Product> listProduct = dao.getAllProduct();
    String name = (String) request.getAttribute("name");
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = dao.getCartProduct(cart_list);
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<html>
<head>
    <title>DANH MỤC :<%=name%>
    </title>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div class="text" style="text-align: center;margin-top: 15px">
    <h3 style="color: #555555; ">DANH SÁCH SẢN PHẨM:<%=name.toUpperCase()%>
    </h3>
</div>
<div class="container">
    <div class="row">
        <%
            List<Product> listS = (List<Product>) request.getAttribute("listA");
            for (Product p : listS) {
        %>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <a href="<%=request.getContextPath()%>/productDetail?id=<%=p.getId()%>">
                    <img class="card-img-top" src="<%=p.getImg_main()%>" alt="Product Image">
                </a>
                <div class="card-body">
                    <h5 class="card-title">
                        <p style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%= p.getName()%>
                        </p>
                    </h5>
                    <h6 class="price">
                        <p><%= format.format(p.getPrice())%>đ
                        </p>
                    </h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a class="btn btn-primary btn-custom" href="#"
                           style="padding: 5px 10px;font-size: 15px;white-space: nowrap">Mua ngay</a>
                        <a class="btn btn-dark btn-custom add-to-cart" href="#"
                           data-id="<%=p.getId()%>" style="padding: 5px 10px;font-size: 15px;white-space: nowrap">Giỏ
                            hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <% }
        %>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>
<script>
    $(document).ready(function () {
        $(".add-to-cart").click(function (e) {
            e.preventDefault();
            var id = $(this).data("id");
            $.ajax({
                url: '<%=request.getContextPath()%>/AddToCartController',
                type: 'GET',
                data: {id: id},
                success: function (response) {
                    if (response.status === "success") {
                        alert("Sản phẩm đã được thêm vào giỏ hàng.");
                    } else if (response.status === "exists") {
                        alert("Sản phẩm đã tồn tại trong giỏ hàng.");
                    } else {
                        alert("Có lỗi xảy ra, vui lòng thử lại.");
                    }
                },
                error: function () {
                    alert("Có lỗi xảy ra, vui lòng thử lại.");
                }
            });
        });
    });
</script>
</body>
</html>
