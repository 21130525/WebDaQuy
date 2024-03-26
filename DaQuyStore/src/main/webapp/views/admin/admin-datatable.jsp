<%--
  Created by IntelliJ IDEA.
  User: ngoke
  Date: 3/11/2024
  Time: 7:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DataTable</title>
    <link rel="stylesheet" href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<button type="button" class="btn btn-primary">Them moi</button>
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
</table>

</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $("#table_id").DataTable({
            paging:true,
            pageLength:5,
            pagingType:'full_numbers'
        })

        ;
    })
    $(document).ready(function () {
        var amount = 3
        $("#btn").click(function () {
            $.ajax({
                url: '/admin-data-user',
                type: 'POST',
                dataType: 'HTML',
                data: amount,
                success: function (response) {
                    $("#body").innerHTML += response
                },
                error: function (error) {
                    console.log("Test thoi")
                }
            })

        })
    })
</script>
</html>
