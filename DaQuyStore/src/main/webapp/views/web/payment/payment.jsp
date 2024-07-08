<%@ page import="model.Product" %>
<%@ page import="service.manageUser.order.OrderService" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.User" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/7/2024
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thanh Toan</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">    <link rel="stylesheet" href="<%=request.getContextPath()%>/font/fontawesome-free-6.4.2/css/all.css">

</head>
<body>
<%
    Map<Product, Integer> listOrder = new HashMap<>();
    double total =0;
    OrderService orderService =  OrderService.getInstance();
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
    <section style="min-height: 620px" class="container-sm">
        <p> Thông tin người dùng </p>
        <p> Người dung: <%=user.getFullName()%></p>
        <p>Địa chỉ: </p>
        <hr class="my-4">
        <div class="col-lg-6">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <p class="mb-1">Thông Tin don hang</p>
                </div>
            </div>
            <!--  danh sach cac san pham -->
            <div class="card mb-3 scrollable-div overflow-auto"   style="max-height: 270px">
                <div class="card-body">
                    <%
                        if(listOrder == null){
                    %>
                    <p>Bạn ko co </p>
                    <%
                    }else{
                        for(Map.Entry<Product,Integer> entry : listOrder.entrySet()){%>
                    <%--product--%>
                    <% Product p = entry.getKey(); %>
                    <% System.out.println(p);%>
                    <div class="d-flex justify-content-between" id="product_<%=p.getId()%>">

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
                                <h5 class="mb-0"><%= orderService.formatNumber( entry.getValue()*p.getPrice())%></h5>
                            </div>

                        </div>
                    </div>
                    <%--end product--%>

                    <%
                            }
                        }
                    %>


                </div>

            </div>
            <hr class="my-4">
            phuong thuc thanh toan
            <hr class="my-4">

            <div class="d-flex justify-content-between">
                <p class="mb-2">Tổng số Tiền</p>
                <p class="mb-2"><%=orderService.formatNumber(total)%> Đ</p>
            </div>

            <div class="d-flex justify-content-between">
                <p class="mb-2">Phí ship</p>
                <p class="mb-2">20.000 Đ</p>
            </div>

            <div class="d-flex justify-content-between mb-4">
                <p class="mb-2">Thanh Toán</p>
                <p class="mb-2"><%=orderService.formatNumber(total-20000)%> Đ</p>
            </div>
            <button type="submit" class="btn btn-info btn-block btn-lg" id="btn">
                <div class="d-flex justify-content-between">
                    <span>Thanh Toan<i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                </div>
            </button>
        </div>
    </section>
    <jsp:include page="../../footer.jsp"/>
</body>
</html>
