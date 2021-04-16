<%-- 
    Document   : history
    Created on : Dec 23, 2020, 2:50:26 AM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>history Page</title>
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
        </form> <br/>
        
        <a href="subject.jsp">Back to find subject</a>
        
        <h1>History Page</h1>
        <c:set var="history" value="${requestScope.HISTORY}" />
        <c:if test="${not empty history}" >
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Notification</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${history}" varStatus="counter" >
                        <tr>
                            <th>
                                ${counter.count}
                            </th>
                            <th>
                                ${dto.notification}
                            </th>
                            <th>
                                ${dto.dateOfChange}
                            </th>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>        
        <c:if test="${empty history}" >No record to match</c:if>
    </body>
</html>
