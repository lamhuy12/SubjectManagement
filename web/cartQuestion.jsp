<%-- 
    Document   : cartQuestion
    Created on : Dec 22, 2020, 11:25:36 PM
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
        </form> <br/>

        <form action="addQuestionToLesson">
            <input type="submit" value="checkOut" />
        </form>

        <form action="history">
            <input type="submit" value="view History" />
        </form>
        
        <a href="subject.jsp">Back to search</a>
        
        <h1>Cart Question</h1>

        <c:set var="question" value="${sessionScope.QUESTIONCART}" />
        <c:if test="${not empty question}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>QuestionID</th>
                        <th>Question</th>
                        <th>LessonID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="removedQuestionFromCart">
                    <c:forEach var="cartQuestion" items="${question.question}" varStatus="counter">
                        <tr>
                            <th>
                                ${counter.count}
                            </th>
                            <th>
                                ${cartQuestion.key}
                            </th>
                            <th>
                                ${cartQuestion.value.question}
                            </th>
                            <th>${cartQuestion.value.lessonID}</th>
                            <th>
                                <input type="checkbox" name="chkRemove" value="${cartQuestion.key}" >
                            </th>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan= "3">
                            <a href="subject.jsp">back to search</a>
                        </td>

                        <td>
                            <input type="submit" value="Remove Selected Question" />
                        </td>
                    </tr>
                </form>
            </c:if>
            <c:if test="${empty question}" >No record to match</c:if>


        </tbody>
    </table>

</body>
</html>
