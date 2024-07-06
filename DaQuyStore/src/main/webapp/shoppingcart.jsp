<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
jsp:include="<page>../header.jsp</page>"<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 4/1/2024
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User auth = (User) request.getSession().getAttribute("user");
    if (auth!=null){
        request.setAttribute("user",auth);
    }
%>
<html>
<head>
    <title>Gio hang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style type="text/css">
        .table th,.table td {
            text-align: center;
            vertical-align: middle;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            width: 20%;
        }

        .form-control {
            width: 20%;
            text-align: center;
        }

        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div class="page-header">
    <jsp:include page="${request.getContextPath()}/views/header.jsp"/>
</div>
<div class="container">
    <div class="d-flex py-3">
        <h3>Total price:33333</h3>
        <a class="mx-3 btn btn-primary" href="#">Check Out</a>
    </div>
    <table class="table table-light">
        <thead>
            <tr>
                <th scope="col">Sản phẩm</th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Xóa</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>KKKK</td>
                <td>200000</td>
                <td>
                    <form action="" method="post" class="form-inline d-flex justify-content-center">
                        <input type="hidden" name="id" value="1"
                               class="form-input">
                        <div class="form-group d-flex justify-content-between w-50">
                            <a class="btn btn-sm btn-decre" href=""><i
                                    class="fas fa-minus-square"></i></a>
                            <input type="text" name="quantity" class="form-control w-50" value="1" readonly >
                            <a class="btn btn-sm btn-incre" href=""><i
                                    class="fas fa-plus-square"></i></a>
                        </div>
                    </form>
                </td>
                <td> <a class="btn btn-sm btn-danger" href=""> Xóa</a></td>
            </tr>

        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</html>
