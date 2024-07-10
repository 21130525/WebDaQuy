<%@ page import="model.User" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %>
<%@ page import="connector.DAOConnection" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="model.Cart" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    DecimalFormat df = new DecimalFormat("#.##");
    request.setAttribute("df", df);
    ProductDao dao = new ProductDao(DAOConnection.getConnection());
    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
    List<Cart> cartProduct = dao.getCartProduct(cart_list);
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<!doctype html>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/cate.css" rel="stylesheet" type="text/html">
    <style>
        .cate {
            background-color: #f0f8ff; /* Màu nền tổng thể */
            padding: 20px;
        }

        .categories .container-fluid {
            background-color: #ffffff; /* Màu nền bên trong */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .image-container {
            text-align: center;
            margin: 20px 0;
            background-color: #FFFAF0; /* Màu nền của vùng chứa hình ảnh và chữ */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .image-container:hover {
            background-color: #FFFAF0; /* Màu nền khi hover */
        }

        .image-container a {
            text-decoration: none;
            color: #333; /* Màu chữ ban đầu */
            transition: color 0.3s ease;
        }

        .image-container a:hover {
            color: #007bff; /* Màu chữ khi hover */
        }

        .category-image {
            width: 100%;
            height: 115px;
            border-radius: 8px; /* Hình ảnh bo tròn */
            transition: transform 0.3s ease;
        }

        .category-image:hover {
            transform: scale(1.05); /* Tăng kích thước khi hover */
        }

        .category-name {
            font-size: 1.1em;
            font-weight: bold; /* Làm cho chữ đậm hơn */
            margin-top: 10px;
            color: #555;
            transition: color 0.3s ease, font-weight 0.3s ease;
        }

        .category-name:hover {
            color: #007bff; /* Màu chữ khi hover */
            font-weight: bolder; /* Làm cho chữ đậm hơn khi hover */
        }
    </style>
</head>

<body>
<div class="page-header">
    <jsp:include page="../../header.jsp"/>
</div>
<div class="cate">
    <section class="categories">
        <div class="container-fluid">
            <div class="row justify-content-center" style="gap: 10px">
                <%
                    List<Category> list = (List<Category>) request.getAttribute("cate");
                    for (Category category : list) {
                %>
                <div class="col-6 col-md-2 image-container">
                    <a href="<%=request.getContextPath()%>/ProductByCategory?name=<%=category.getCategory_name()%>">
                        <img class="category-image" src="<%=category.getImg()%>" alt="">
                        <p class="category-name"><%= category.getCategory_name()%>
                        </p>
                    </a>
                </div>
                <% } %>
            </div>
        </div>
    </section>
</div>

<div class="cate">
    <div class="container-fluid">
        <h3 style="text-align: center; font-size:50px;font-weight: bold ">Danh sách sản phẩm</h3>
        <div class="row">
            <% List<Product> listProduct = (List<Product>) request.getAttribute("listA");
                for (Product p : listProduct) {
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
            <%
                }
            %>
        </div>
        <div class="text-center">
            <nav aria-label="Page">
                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="1" end="${ endP }">
                        <li class="${tag == i?"active":""}"><a class="page-link"
                                                               href="Category?index=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>

<%--<div class="page-footer">--%>
<%--    <jsp:include page="${request.getContextPath()}/views/footer.jsp"/>--%>
<%--</div>--%>
<!-- JS-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>
