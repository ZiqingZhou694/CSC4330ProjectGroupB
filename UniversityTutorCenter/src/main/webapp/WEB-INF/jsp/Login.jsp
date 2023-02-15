<%--
  Created by IntelliJ IDEA.
  User: jing7
  Date: 2/14/2023
  Time: 12:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <head>
        <title>Sign Up</title>
        <script type="text/javascript" src="${basePath}/js/jquery-3.6.1.js"></script>
        <script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
    </head>
</head>
<body>
<h1>Login</h1>
<form id="loginForm">
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div>
        <select id="userType" name="userType">
            <option value="2">Student</option>
            <option value="3">Tutor</option>
            <option value="1">Admin</option>
        </select>
    </div>
    <div>
        <input type="submit" value="Login">
    </div>
</form>

<script>
    $(document).ready(function(){
        $("#loginForm").submit(function(event){
            event.preventDefault();
            var email = $("#email").val();
            var password = $("#password").val();
            var userType = $("#userType").val();
            $.ajax({
                type: "POST",
                url: "/system/login",
                data: {email: email, password: password, userType: userType},
                success: function(response) {
                    alert("Login successful!");
                    <%--window.location.href = "<%=request.getContextPath()%>/login";--%>
                },
                error: function(response) {
                    alert("Sign up failed. Please try again.");
                }

            });
        });
    });
</script>
</body>
</html>
