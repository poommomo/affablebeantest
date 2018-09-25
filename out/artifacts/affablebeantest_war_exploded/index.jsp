<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Products</title>
</head>
<body>
<h1>Sample Search Page</h1>
<form action="index.jsp">
    <input type="text" name="firstName"><br>
    <input type="text" name="lastName"><br>
    <button type="submit">SUBMIT</button>
</form>
<p>
  <%--Query: <c:out value="${param.q}"/><br/>--%>
      Name: <%= request.getParameter("firstName") %>  <%= request.getParameter("lastName") %>
    <%--Name: <c: out value="${param.firstName}"/> <c: out value="${param.lastName}"></c:>--%>
</p>

</body>
</html>