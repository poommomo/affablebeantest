<%--
  Created by IntelliJ IDEA.
  User: Chayapol
  Date: 27/8/2561
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>


<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<%--<form action="product2.jsp">--%>
    <%--<input type="text" name="name"><br>--%>
    <%--<button type="submit">SUBMIT</button>--%>
<%--</form>--%>

<%--<h1><%= request.getParameter("name") %></h1>--%>

<sql:query dataSource="jdbc/affablebean" var="result">
    SELECT * FROM category, product
    WHERE category.id = product.category_id
    <%--WHERE category.id = product.category_id and product.name like '%<%= request.getParameter("name")%>%'--%>
</sql:query>


<div class="container">
    <h1>Products</h1>
    <a href="product.jsp">ADD</a>

    <table class="table table-striped">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.name}"/></td>
                <td><c:out value="${row.description}"/></td>
                <td><c:out value="${row.price}"/></td>
                <td><button class="btn btn-warning" onclick="window.location='product-update.jsp?id=<c:out value="${row.id}"/>';">UPDATE</button></td>
                <td><button class="btn btn-danger" onclick="confirmDelete(<c:out value="${row.id}"/>);">DELETE</button></td>
                    <%--<td><a href="addproduct?id=<c:out value="${row.id}"/>&cmd=d">DEL</a></td>--%>
            </tr>
        </c:forEach>
    </table>

</div>


</body>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure?')) {
            window.location = "addproduct?cmd=d&id="+id;
        }
    }
</script>
</html>
