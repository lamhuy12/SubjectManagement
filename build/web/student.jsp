<%-- 
    Document   : student
    Created on : Dec 16, 2020, 12:32:38 AM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>    
    <c:if test="${empty sessionScope}">
        <c:redirect url="login.html"/>
    </c:if>

    <font color="red">
    Welcome, ${sessionScope.FULLNAME}
    </font> <br/>

    <form action = "logOut">
        <input type="submit" value="Log out" />
    </form>

    <form action="history">
        <input type="submit" value="view History" />
    </form>
    
    <a href="subject.jsp">Click here to see subject</a>
</body>
</html>
