<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/3/2024
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <style>
        #register .container-register {
            width: 1000px;
            padding-top: 30px;
            margin: auto;
        }
        #register .bg {
            padding: 10px;
            background-color: #F1E88B;
        }
        #register .bg-form {
            background-color: #FCF7DC;
            /* Định dạng viền: 2px độ dày, solid kiểu viền, black màu sắc */
            border: 5px solid black;
            border-radius: 3%;
        }
        #register .logo img {
            margin-top: 10px;
            height: 100px;
            width: 100px;
        }
        #register .banner img {
            width: 100%;
            height: 100%;
        }
        #register .bg-inform {
            margin: auto;
            width: 600px;
            border: 2px solid black;
            background-color: #F1E7D0;
        }
        #register .commit input{
            height: 40px;
            width: 40px;
            margin-left: 30px;
            margin-right: 30px;
        }
        #register button{
            height: 50px;
            width: 100px;
            background-color: #e2c16c;
            border: 2px solid black;
            border-radius: 15px;
            margin: 10px;
        }

        #register button:hover{
            background-color: #F5DB62;
            font-weight: bold;
        }
    </style>
</head>

<body>
<jsp:include page = "/views/header.jsp"/>
<div><h1 style="color:red"><%=(request.getAttribute("announced")!=null?request.getAttribute("announced"):"")%></h1></div>

<section id="register">
    <div class="container-register">
        <div class="row bg">
            <!-- anh hien thi  -->
            <div class="col-4 banner text-center">
                <img src="<%=request.getContextPath()%>/img/banner/TTN-2.png" alt="">
            </div>
            <!-- form nhap du lieu  -->
            <div class="col-8 bg-form fs-6">
                <form class="form-register" action="<%=request.getContextPath()%>/register" method="post"
                      onsubmit="return validatePassword()">
                    <%--action--%>
                    <input type="hidden" name="action" value="RegisterWeb">
                    <div class="row text-center">
                        <div class="logo">
                            <img src="<%=request.getContextPath()%>/img/logo.png">
                        </div>
                        <div class="mt-2">
                            <h2>Đăng ký</h2>
                        </div>
                    </div>
                    <div class="bg-inform ">
                        <!-- user -->
                        <div class="row mt-2">

                            <label for="user">Tài khoản*:</label>
                            <br>
                            <input type="text" name="user" placeholder="Tài khoản" id="user" value=""
                                   pattern="^[a-zA-Z0-9]{2,10}$" title="Tên phải có 2-10 ký tự và chỉ chứa chữ cái và số."
                                   required>
                            <br>
                        </div>
                        <!-- pasword -->
                        <div class="row mt-2">

                            <label for="password">Mật khẩu*:</label>
                            <br>
                            <input type="password" name="pass" placeholder="Mật khẩu" id="password" value=""
                                   pattern="^.{3,15}$"
                                   title="Mật khẩu phải chứa 3 đến 15 ký tự khong chứa khoản trắng và ký tự đặt biệt."
                                   required>
                            <label class=" mt-2" for="repeat">Nhập lại mật khẩu*:</label>
                            <br>
                            <input type="password" name="repeat" placeholder="Nhập lại mật khẩu" id="repeat" value=""
                                   pattern="^.{3,15}$"
                                   title="Mật khẩu phải chứa 3 đến 15 ký tự khong chứa khoản trắng và ký tự đặt biệt."
                                   required>
                            <br>
                        </div>
                        <!-- email -->
                        <div class="row mt-2">

                            <label for="email">Email*:</label>
                            <br>
                            <input type="email" name="email" placeholder="Nhập email" id="email" value=""
                                   pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$"
                                   title="Tên phải có 2-10 ký tự và chỉ chứa chữ cái và số." required>
                            <br>
                        </div>
                        <!-- commit -->
                        <div class=" commit d-flex  mt-2">
                            <input type="checkbox" name="policy" id="policy" class=""
                                   title="Bạn có chấp nhận chính sách của chúng tôi không" required>
                            <label for="policy">
                                *Tôi cam kết đã đọc và
                                chấp nhận tất cả điều khoản
                                và điều kiện của dịch vụ/sản phẩm này.
                            </label>
                        </div>

                        <div class="d-block text-center mx-auto ">
                            <button class="" type="submit" >Đăng ký</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/views/footer.jsp"/>

<script>
    function validatePassword(){
        var password = document.getElementById("password").value;
        var repeat = document.getElementById("repeat").value;
        if (password !== repeat) {
            alert("Mật khẩu và nhập lại mật khẩu khong giống nhau");
            return false;
        }
        return true;
    }
</script>
</body>

</html>