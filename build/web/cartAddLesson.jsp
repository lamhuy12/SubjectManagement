<%-- 
    Document   : cartAddLesson
    Created on : Dec 19, 2020, 11:33:56 PM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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

        <a href="subject.jsp">Back to search</a>

        <h1>Your Cart</h1> <br/>



        <c:set var="cart" value="${sessionScope.COMPCART}" />  <%-- CartLessonObj --%>
        <c:if test="${not empty cart}" >
            <%--<c:set var="getLesson" value="${cart.listLesson}" />--%>
            <%--<c:if test="${not empty getLesson}" >--%>
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>lessonID</th>
                        <th>Name</th>
                        <th>subjectID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="removedLessonFromCart">
                    <c:forEach var="lesson" items="${cart}" varStatus="counter">

                        <tr>
                            <th>
                                ${counter.count}
                            </th>
                            <th>
                                ${lesson.key.lessonID}
                            </th>
                            <th>
                                ${lesson.key.name}

                            </th>
                            <th>
                                ${lesson.value}                                        
                            </th>
                            <th>
                                <input type="checkbox" name="chkRemove" value="${lesson.key.lessonID} - ${lesson.value}" >
                            </th>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan= "4">
                            <a href="addLessonAvailable">Add available lesson</a> <br/>
                            <a href="addLessonForm">Add new lesson</a> <br/>
                        </td>

                        <td>
                            <input type="submit" value="Remove Selected Lesson" />
                        </td>
                    </tr>
                </form>
                <form action="addLessonToSubject">
                    <input type="submit" value="checkOut" />
                </form>

            </tbody>
        </table>
    </c:if>
    <c:if test="${empty cart}">No record to match</c:if>
    <%--</c:if>--%>
</tbody>

</body>
</html>
