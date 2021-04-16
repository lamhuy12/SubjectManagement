<%-- 
    Document   : teacher
    Created on : Dec 15, 2020, 11:39:57 PM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>

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

        <a href="subject.jsp">Click here to search subject </a>

        <h2>Search student and teacher</h2>
        <form action="search">
            Fullname: <input type="text" name="txtSearch" placeholder="Enter Fullname" 
                             value="${param.txtSearch}" /> <br/>
            <input type="submit" value="Search" />
        </form> <br/>



        <c:set var="searchValue" value="${param.txtSearch}" />
        <c:if test="${not empty searchValue}" >
            <c:set var="result" value="${requestScope.SEARCHVALUE}"/>
            <c:if test="${not empty result}" >
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Role</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter" >
                        <form action="updateAccount">
                            <tr>
                                <td>
                                    ${counter.count}
                                    .</td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" name="txtUsername" value="${dto.username}" />
                                </td>
                                <td>
                                    <input type="text" name="txtFullname" value="${dto.fullname}" />
                                </td>
                                <td>

                                    <input type="text" name="txtRole" value="${dto.role}" />
                                </td>
                                <td>
                                    <input type="submit" value="Update"  />
                                    <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                </td>
                                <td>
                                    <c:url var="urlRewriting" value="deleteAccount" > 
                                        <c:param name="pk" value="${dto.username}" />
                                        <c:param name="lastSearchValue" value="${searchValue}" />
                                    </c:url>
                                    <a href="${urlRewriting}">Delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>

                <form action="addLessonToSubject">
                    <input type="submit" value="checkout" />
                </form>
            </table>

        </c:if>
        <c:if test="${empty result}" > No record to match</c:if>
    </c:if>
</body>
</html>
