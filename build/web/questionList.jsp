<%-- 
    Document   : questionList
    Created on : Dec 22, 2020, 9:41:25 PM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Page</title>
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

        <form action="history">
            <input type="submit" value="view History" />
        </form>

        <c:set var="listQuestion" value="${requestScope.LISTQUESTION}" />
        <c:if test="${not empty listQuestion}" >
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>question</th>
                        <th>add to cart</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="getListQuestion" items="${listQuestion}" varStatus="counter" >
                    <form action="addQuestionToCart">
                        <tr>
                            <th>
                                ${counter.count}
                            </th>
                            <th>
                                ${getListQuestion.question}

                            </th>
                            <th>
                                <input type="hidden" name="txtQuestionID" value="${getListQuestion.questionID}" />
                                <input type="hidden" name="txtLessonID" value="${requestScope.LEID}" />
                                <input type="submit" value="Add to cart" />
                            </th>
                        </tr>
                    </form>

                </c:forEach>

                <a href="cartQuestion.jsp">view Cart</a>
            </tbody>
        </table>

    </c:if>
    <c:if test="${empty listQuestion}" >No record to match</c:if>
</body>x
</html>
