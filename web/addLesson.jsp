<%-- 
    Document   : addLesson
    Created on : Dec 18, 2020, 11:16:35 PM
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

        <form action="history">
            <input type="submit" value="view History" />
        </form>

        <a href="subject.jsp">Click here to return search</a> <br/>
        
        <h1>Add new lesson</h1>

        <form action="addLessonToCart" method="POST">
            <c:set var="lessonErr" value="${requestScope.ERRORATLESSON}" />
            LessonID: <input type="text" name="txtLessonID" value="${param.txtLessonID}" /> (1-50 chars) <br/>
            <c:if test="${not empty lessonErr.lessonIDLengthErr}" >
                <font color="red">
                ${lessonErr.lessonIDLengthErr}
                </font>
            </c:if>
            Name: <input type="text" name="txtLessonName" value="${param.txtLessonName}" /> (1-50 chars) <br/>
            <c:if test="${not empty lessonErr.lessonLengthErr}" >
                <font color="red">
                ${lessonErr.lessonLengthErr}
                </font>
            </c:if>
            Theory: <input type="text" name="txtTheory" value="" /> (1-50 chars)<br/>
            <c:if test="${not empty lessonErr.theoryLengthErr}" >
                <font color="red">
                ${lessonErr.theoryLengthErr}
                </font>
            </c:if>
            Exam: <input type="text" name="txtExam" value="" /> (1-50 chars)<br/>
            <c:if test="${not empty lessonErr.examLengthErr}" >
                <font color="red">
                ${lessonErr.examLengthErr}
                </font>
            </c:if>
            Test: <input type="text" name="txtTest" value="" /> (1-50 chars)<br/>
            <c:if test="${not empty lessonErr.testLengthErr}" >
                <font color="red">
                ${lessonErr.testLengthErr}
                </font>
            </c:if>
            subjectID: <select name="cbsubjectID">
                <c:forEach var="subject" items="${requestScope.LISTSUB}">
                    <option>${subject.subID} - ${subject.subjectName}</option>
                </c:forEach>
            </select> <br/>
            <input type="submit" value="Add lesson to cart" />
            <input type="hidden" name="blabla" value="addNew" />
        </form>

        <a href="PreViewCart">view Cart</a>

    </body>
</html>
