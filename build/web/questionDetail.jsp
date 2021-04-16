<%-- 
    Document   : questionDetail
    Created on : Dec 23, 2020, 1:55:15 AM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        <c:set var="getDetail" value="${requestScope.QUESTION}" />
        <c:if test="${not empty getDetail}" >
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Question</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="detail" items="${getDetail}" varStatus="counter">
                    <form action="UpdateQuestion">
                        <tr>
                            <th>
                                ${counter.count}
                            </th>
                            <th>
                                ${detail.question}
                                <input type="hidden" name="txtQuestionID" value="${detail.questionID}" />
                                <input type="text" name="txtQuestion" value="${detail.question}" />
                            </th>
                            <th>
                                <input type="submit" value="Update" />
                            </th>
                        </tr>
                    </form>

                </c:forEach>
            </tbody>
        </table>

    </c:if>

    <c:if test="${empty getDetail}" >No record to match</c:if>



</body>
</html>
