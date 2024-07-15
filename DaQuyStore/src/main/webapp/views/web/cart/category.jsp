<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="model.Cart" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="connector.DAOConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Category" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
    NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
    ProductDao dao = new ProductDao(DAOConnection.getConnection());
    Cart cart_list = (Cart) request.getSession().getAttribute("cart-list");

%>

<!doctype html>
<html>
<head>
    <title></title>
    <link href="<%=request.getContextPath()%>/css/cate.css" rel="stylesheet" type="text/html">
    <style>
        .cate {
            background-color: #f0f8ff;
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
<jsp:include page="../../header.jsp"/>
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
            <% List<Product> listProduct = (List<Product>) request.getAttribute("listP");
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
                            <p><%= format.format(p.getPrice()) %>đ
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
            <% } %>
        </div>
        <!-- Phân trang -->
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
                success: function (data) {
                    console.log(data.reponseCode)
                    if (data.reponseCode === 200) {
                        alert("Sản phẩm đã được thêm vào giỏ hàng.");
                        $("#quantitycart").each(function () {
                            var quantity = $(this).text()
                            console.log(quantity)
                            $(this).text(parseInt(quantity) + 1)
                        });

                    } else if (data.reponseCode === 400) {
                        alert("Sản phẩm không tồn tại");
                    }
                },
                error: function () {
                    console.log(data.reponseCode)
                    alert("Có lỗi xảy ra, vui lòng thử lại.");
                }
            });
        });
    });
</script>
</body>
</html>
