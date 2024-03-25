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
        <th>Col1</th>
        <th>Col2</th>
        <th>Col3</th>
    </tr>
    </thead>
    <tbody id="body">
    <tr>
        <td>data-1a</td>
        <td>data-1b</td>
        <td>data-1c</td>
    </tr>
    <tr>
        <td>data-2a</td>
        <td>data-2b</td>
        <td>data-2c</td>
    </tr>
    <tr>
        <td>data-3a</td>
        <td>data-3b</td>
        <td>data-3c</td>
    </tr>
    <tr>
        <td>data-4a</td>
        <td>data-4b</td>
        <td>data-4c</td>
    </tr>
    </tbody>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thong bao</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Ban co muon luu thay doi khong
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huy</button>
                    <button type="button" class="btn btn-primary">Luu thay doi</button>
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
    $(document).ready(function (){
        $("#table_id").DataTable();
    })


</script>
</html>
