<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/9/2024
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quan li nguoi dung</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<button type="button" class="btn btn-primary" id="btn-promp">Trạng thái</button>
<button type="button" class="btn btn-primary"><i class="fa-solid fa-plus"></i>Them moi</button>
<table id="table_id" class="table table-striped">
    <thead>
    <tr>
        <th>Tai khoan</th>
        <th>Mat khau</th>
        <th>Ho ten</th>
        <th>Gioi tinh</th>
        <th>Ngay sinh</th>
        <th>Email</th>
        <th>SDT</th>
        <th>Dia chi</th>
        <th>Avatar</th>
        <th>Ngay tao</th>
        <th>Ngay cap nhat</th>
        <th>Vai tro</th>
        <th>Trang thai</th>
    </tr>
    </thead>
    <tbody id="body">
    <%--    <tr>--%>
    <%--        <td>data-1a</td>--%>
    <%--        <td>data-1b</td>--%>
    <%--        <td>data-1c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-2a</td>--%>
    <%--        <td>data-2b</td>--%>
    <%--        <td>data-2c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-3a</td>--%>
    <%--        <td>data-3b</td>--%>
    <%--        <td>data-3c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-4a</td>--%>
    <%--        <td>data-4b</td>--%>
    <%--        <td>data-4c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-4a</td>--%>
    <%--        <td>data-4b</td>--%>
    <%--        <td>data-4c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-4a</td>--%>
    <%--        <td>data-4b</td>--%>
    <%--        <td>data-4c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <td>data-4a</td>--%>
    <%--        <td>data-4b</td>--%>
    <%--        <td>data-4c</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>
    <%--        --%>
    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--        <td>3</td>--%>
    <%--        <td>4</td>--%>

    <%--        <td>1</td>--%>
    <%--        <td>2</td>--%>
    <%--    </tr>--%>
    </tbody>
</table>
<%--<jsp:include page="admin_menu.jsp"></jsp:include>--%>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $("#table_id").DataTable();
    })


    var $tbody = $('#body')
    $(document).ready(function () {
        $.ajax({
            url: '<%=request.getContextPath()%>/getuser',
            method: 'GET',
            dataType: 'JSON',
            success: function (response) {
                $.each(response, function (index, value) {
                        var value_item = Object.keys(value)
                        var $row = $('<tr>')
                        value_item.forEach(function (key) {
                            var value_item_key = value[key]
                            var $cell = $('<td>').text(value_item_key)
                            $row.append($cell)
                        })
                        $tbody.append($row);
                    }
                )

            }
        })
    });
    $(document).ready(function (){
        $('#btn-promp').click(function(){
            let input_account = window.prompt('Mời bạn nhập tài khoản');
            if(input_account !== null){
                let inform_account = confirm('Bạn có muốn chuyển đổi quyền của tài khoản không?');
                if(inform_account === true){
                    $.ajax({
                        url: 'url_cua_ban', // Thay 'url_cua_ban' bằng URL thực tế của bạn
                        data: JSON.stringify({account: input_account}), // Ép input_account thành chuỗi JSON
                        method: 'GET',
                        dataType: 'json',
                        success: function (response){
                            alert('Chuyển đổi quyền thành công')
                        },
                        error: function(error){
                            alert('Chuyển đổi quyền không thành công');
                        }
                    });
                }
            }
        });
    });
</script>
</html>
