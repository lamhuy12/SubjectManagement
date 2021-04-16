<%-- 
    Document   : subject
    Created on : Dec 16, 2020, 11:44:33 PM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Page</title>
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
        
        <h1>Search subject</h1>
        <form action="searchSubject" method="POST">
            Search: <input type="text" name="txtSearchSubject" value="${param.txtSearchSubject}" placeholder="Enter subject name"/>
            <input type="submit" value="Search" />
        </form>

        <c:set var="searchSubjectValue" value="${param.txtSearchSubject}" />
        <c:if test="${not empty searchSubjectValue}" >
            <c:set var="resultSubject" value="${requestScope.SEARCHSUBJECT}" />
            <c:if test="${not empty resultSubject}" >
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Lesson detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${resultSubject}" varStatus="counter">
                        <form action="lesson">
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.subID}
                                    <input type="hidden" name="txtSubID" value="${dto.subID}" />
                                </td>
                                <td>
                                    ${dto.subjectName}
                                </td>
                                <td>
                                    <input type="submit" value="Lesson Detail" />
                                </td>    
                            </tr>      
                        </form>
                    </c:forEach> <br/>

                    <form action="addLessonForm">
                        <input type="submit" value="Add new lesson" />
                    </form> ||

                    <form action="addLessonAvailable">
                            <input type="submit" value="Add available lesson" />
                    </form>

                </tbody>
            </table>

        </c:if>
        <c:if test="${empty resultSubject}" >No record to match</c:if>
    </c:if>
        
        <a href="cartAddLesson.jsp">cart Lesson</a> <br/>
        <a href="cartQuestion.jsp">cart Question</a>
</body>
</html>
