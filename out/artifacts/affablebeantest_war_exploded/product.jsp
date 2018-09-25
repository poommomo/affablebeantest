<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:query dataSource="jdbc/affablebean" var="result">
    SELECT * FROM category
</sql:query>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h1>Product</h1>

    <form class="form-horizontal" action="addproduct">

        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="price">Price:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="price" name="price" placeholder="Enter product price">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="info">Description:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="info" name="info" placeholder="Enter product description">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="category">Category:</label>

            <select class="col-sm-10" id="category" name="category">
                <c:forEach var="row" items="${result.rows}">
                    <option value='<c:out value="${row.id}"/>'>
                        <c:out value="${row.name}"/>
                    </option>
                </c:forEach>
            </select>
            <%--<select class="col-sm-10" id="category" name="category">--%>
                <%--<option value="1">1</option>--%>
                <%--<option value="2">2</option>--%>
                <%--<option value="3">3</option>--%>
                <%--<option value="4">4</option>--%>
            <%--</select>--%>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </div>

    </form>

</div>
</body>
</html>