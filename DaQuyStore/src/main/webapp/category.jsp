<%@ page import="model.User" %>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="dao.userDAO.ProductDao" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/DaQuyStore_war/css/cate.css">
</head>
<%User user = (User) request.getSession().getAttribute("user");%>
<%NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<body>
<section class="categories">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <%--            <c:forEach var=""></c:forEach>--%>
            <% CategoryDao dao = new CategoryDao();
                List<Category> list = null;
                list = dao.listCategory();
                for (Category category : list) {
            %>
            <div class="col-6 col-md-2 image-container" date-category-name="<%=category.getCategory_name()%>" al>
<%--                <a href="ProductByCategory?name=<%=category.getCategory_name()%>">--%>
                <a href="<%=request.getContextPath()%>/ProductByCategory?name=<%=category.getCategory_name()%>">
                    <img src="<%=category.getImg()%>">
                    <p><%= category.getCategory_name()%>
                    </p>
                </a>
            </div>
            <% } %>
        </div>
    </div>
</section>
<section class="load_categories">
    <div class="container">
        <div class="col-sm-9">
            <div class="rol">
                <h2>Category:<c:out value="${name}"/></h2>
            </div>
            <div id="category-product">

            </div>
        </div>
    </div>

</section>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        addcart();--%>
<%--    });--%>

<%--    function addcart() {--%>
<%--        $('.image-container').on('click',function (e) {--%>
<%--                e.preventDefault();--%>
<%--                const name = this.value;--%>
<%--                console.log(name);--%>

<%--                $.ajax({--%>
<%--                    url: "<%=request.getContextPath()%>/ProductByCategory/?name=" +encodeURIComponent(name),--%>
<%--                    type: "post",--%>
<%--                    data: {--%>
<%--                        name: name--%>
<%--                    },--%>
<%--                    success: function (data) {--%>
<%--                        $("#category-product").html(data);--%>

<%--                    },--%>
<%--                });--%>
<%--            });--%>
<%--    };--%>

<%--</script>--%>
<!-- JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
