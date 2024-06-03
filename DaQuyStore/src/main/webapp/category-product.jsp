<%@ page import="model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="categories">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <%--            <c:forEach var=""></c:forEach>--%>
            <%
                List<Product> list = (List<Product>) request.getAttribute("list");
                for (Product product : list) {
            %>
            <div class="col-6 col-md-2 image">
                <img  src="<%=product.getImg_main()%>" style="height: 300px;width: 100px">
                <p><%= product.getName()%>
                </p>
            </div>
            <% } %>
        </div>
    </div>
</section>
</body>
</html>
