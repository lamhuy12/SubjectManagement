<%-- 
    Document   : createNewAccount
    Created on : Nov 4, 2020, 12:23:03 AM
    Author     : HUYVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
    </head>
    <body>
        <h1>Create New Account</h1>
        <form action="createNewAccount" method="POST">
            <c:set var="errors" value="${requestScope.CREATEER}"/>
            Username* <input type="text" name="txtUsername" 
                             value="${param.txtUsername}" /> (1-50 chars) </br>
            <c:if test="${not empty errors.usernameLengthErr}">
                <font color ="red">
                ${errors.usernameLengthErr}
                </font> </br>
            </c:if>  
            <c:if test="${not empty errors.usernameIsExisted}">
                <font color ="red">
                ${errors.usernameIsExisted}
                </font> </br>
            </c:if> 
            Password* <input type="password" name="txtPassword" value="" /> (1-50 chars) </br>
            <c:if test="${not empty errors.passwordLengthErr}">
                <font color ="red">
                ${errors.passwordLengthErr}
                </font> </br>
            </c:if>
            Confirm* <input type="password" name="txtConfirm" value="" /> </br>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color ="red">
                ${errors.confirmNotMatched}
                </font> </br>
            </c:if>
            Full name* <input type="text" name="txtFullname" 
                              value="${param.txtFullname}" /> (1-50 chars) </br>
            <c:if test="${not empty errors.fullnameLengthErr}">
                <font color ="red">
                ${errors.fullnameLengthErr}
                </font> </br>
            </c:if>
            <input type="submit" value="Create New Account"  /> </br>
            <input type="reset" value="Reset" />
        </form>
        <a href="login.html">Click here to login</a>
    </body>
</html>
