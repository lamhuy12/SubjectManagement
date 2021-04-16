<%-- 
    Document   : lesson
    Created on : Dec 18, 2020, 12:08:24 AM
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


        <c:set var="resultLesson" value="${requestScope.RESULTLESSON}" />
        <c:if test="${not empty resultLesson}">           
            <table border="1">
                <thead>
                <h2>Details</h2>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Theory</th>
                    <th>Exam</th>
                    <th>Test</th>
                    <th>Update</th>
                    <th>Delete</th>
                    <th>Question</th>
                    <th>View Question</th>
                    <th>Take exam this lesson</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="lessonDTO" items="${resultLesson}" varStatus="counter">
                <form action="updateLesson">
                    <tr>
                        <th>
                            ${counter.count}
                        </th>
                        <th>
                            ${lessonDTO.lessonID}
                            <input type="hidden" name="txtLessonID" value="${lessonDTO.lessonID}" />
                        </th>
                        <th>                            
                            <input type="text" name="txtLessonName" value="${lessonDTO.name}" />
                        </th>
                        <th>

                            <input type="text" name="txtLessonTheory" value="${lessonDTO.theory}" />
                        </th>
                        <th>

                            <input type="text" name="txtLessonExam" value="${lessonDTO.exam}" />
                        </th>
                        <th>

                            <input type="text" name="txtLessonText" value="${lessonDTO.test}" />
                        </th>
                        <th>
                            <input type="submit" value="Update" />
                            <input type="hidden" name="subID" value="${requestScope.SUBID}" />
                        </th>
                        <th>
                            <c:url var="urlRewriting" value="deleteLesson" > 
                                <c:param name="pkDeleteLesson" value="${lessonDTO.name}" />
                                <c:param name="subIDDelete" value="${requestScope.SUBID}" />
                            </c:url>
                            <a href="${urlRewriting}">Delete</a>
                        </th>
                        </th>
                        <th>
                            <a href="question">question Detail</a>
                        </th>
                        <th>
                            <c:url var="glq" value="getListQuestion">
                                <c:param name="txtLessonID" value="${lessonDTO.lessonID}"/>
                            </c:url>
                            <a href="${glq}">List Question</a> 
                        </th>
                        <th>
                            <input type="submit" value="Take exam" />
                        </th>
                    </tr>
                </form>
            </c:forEach>


        </tbody>
    </table>
</c:if>
<c:if test="${empty resultLesson}">No record to match</c:if>
</body>
</html>
