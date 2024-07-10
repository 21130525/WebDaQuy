<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="connector.DAOConnection" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat df = new DecimalFormat("#.##");
    request.setAttribute("df", df);
    ProductDao dao = new ProductDao(DAOConnection.getConnection());
    List<Product> listProduct = dao.getAllProduct();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
    List<Cart> cartProduct = dao.getCartProduct(cart_list);
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/cate.css" rel="stylesheet" type="text/html">
</head>
<body>

<div class="container">
    <div class="row">
        <%
                List<Product> list = (List<Product>) request.getAttribute("listA");
                for (Product p : list) {
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
                        <p><%=p.getPrice()%>
                        </p>
                    </h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a class="btn btn-primary btn-custom" href="#"
                           style="padding: 5px 10px;font-size: 15px;white-space: nowrap">Mua ngay</a>
                        <a class="btn btn-dark btn-custom" href="AddToCartController?id=<%=p.getId()%>"
                           style="padding: 5px 10px;font-size: 15px;white-space: nowrap">Giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <% }
        %>
    </div>
    <div class="text-center">
        <nav aria-label="Page">
            <ul class="pagination justify-content-center">
                <c:forEach var="i" begin="1" end="${ endP }">
                    <li class="${tag == i?"active":""}"><a class="page-link"
                                                           href="ProductByCategory?index=${i}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
<!-- JS-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>
