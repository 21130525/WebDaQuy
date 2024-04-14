<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/9/2024
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Product</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<button type="button" class="btn btn-primary" id="btn">Them moi</button>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
   Luu
</button>
<select class="form-select" aria-label="Default select example">
    <option selected>Open this select menu</option>
    <option value="1">Loại</option>
    <option value="2">Giá</option>
    <option value="3">Bán chạy</option>
    <option value="4">Giảm gia</option>
</select>
<table id="table_id" class="table table-striped">
    <thead>
    <tr>
        <th>Ten san pham</th>
        <th>Gia</th>
        <th>Tinh trang</th>
        <th>Giam gia</th>
        <th>Hot</th>
        <th>Color</th>
    </tr>
    </thead>
    <tbody id="body">

    </tbody>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Open modal for @mdo</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">Recipient:</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="product-name" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="product-name"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="price"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="status"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="sale" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="sale"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="hot" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="hot"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="color" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="color"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send message</button>
                </div>
            </div>
        </div>
    </div>
</table>
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
    var $tbody = $('#body')
    $(document).ready(function () {
        $.ajax({
            url: '<%=request.getContextPath()%>/getproduct_admin',
            method: 'GET',
            dataType: 'JSON',
            success: function (response) {
                $.each(response, function (index, value) {
                        var value_item=Object.keys(value)
                        var $row = $('<tr>')
                        value_item.forEach(function(key){
                            var value_item_key=value[key]
                            var $cell=$('<td>').text(value_item_key)
                            $row.append($cell)
                        })
                        $tbody.append($row);
                    }
                )

            }
        })
    });
    $(document).ready(function (){
        $('#btn_accept').click(function (){
            $.ajax({
                url:'<%=request.getContextPath()%>/addproduct_admin',
                method:'GET',
                data:JSON.stringify(product={
                    product_name:input.value,
                    price:input.value,
                    status:input.value,
                    sale:input.value,
                    hot:input.value,
                    color:input.value
                }),
                contentType:'application/json',
                success:function (response){
                    alert('Them san pham thanh cong')
                    window.location.href='#'
                },
                error:function(error){
                    alert('Them san pham khong thanh cong')
                    window.location.href='#'
                }
            })
        })
    })
    $(document).ready(function(){
        $('#btn_taolao').click(function(){
            $('#btn_taolao').hide()
        })
    })
    $(document).ready(function (){
        $("#table_id").DataTable();
    })


</script>
</html>
