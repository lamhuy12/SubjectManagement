<%-- 
    Document   : addLessonErr
    Created on : Dec 19, 2020, 1:17:46 AM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <c:set var="lessonErr" value="${requestScope.ERRORATLESSON}" />
        <c:if test="${not empty lessonErr}" >
            <h1>Must follow the request when create new lesson</h1>
        </c:if>
        <h1>Somethings went wrong</h1>
        <a href="subject.jsp">Click here to back to search</a>
    </body>
</html>
