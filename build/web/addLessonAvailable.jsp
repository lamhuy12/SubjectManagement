<%-- 
    Document   : addLessonAvailable
    Created on : Dec 19, 2020, 10:45:53 PM
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
        <h1>choose lesson to add</h1>
        <form action="addLessonToCart">
            Lesson: <select name="lesson">
                    <c:forEach var="lesson" items="${requestScope.LISTLESSON}" >
                        <option>${lesson.lessonID} - ${lesson.name}</option>
                    </c:forEach>
                </select> <br/>

                subjectID: <select name="subjectID">
                    <c:forEach var="subject" items="${requestScope.LISTSUBJECT}">
                        <option>${subject.subID} - ${subject.subjectName}</option>
                    </c:forEach>
                </select> <br/>

                <input type="submit" value="Add to cart" />
                <input type="hidden" name="blabla" value="addAvailable" />
        </form> <br/>
        
        <a href="PreViewCart">view Cart</a>
                
    </body>
</html>
