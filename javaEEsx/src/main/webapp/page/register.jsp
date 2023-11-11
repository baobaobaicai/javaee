<%--
  Created by IntelliJ IDEA.
  User: cyh
  Date: 2023/11/8
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Utill.CustomUtil" %>
<%@ page import="com.entity.People" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomUtil.outPosition("yellow", "register.jsp");
    CustomUtil.outParameter("yellow", "request.getContextPath()", request.getContextPath());
    CustomUtil.outParameter("yellow", "request.getRequestURL()", String.valueOf(request.getRequestURL()));
%>
<html>
<head>

    <title>Title</title>
</head>
<body>

</body>
</html>
