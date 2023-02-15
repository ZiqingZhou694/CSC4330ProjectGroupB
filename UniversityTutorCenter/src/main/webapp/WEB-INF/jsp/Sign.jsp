<%--
  Created by IntelliJ IDEA.
  User: jing7
  Date: 2/14/2023
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <script type="text/javascript" src="${basePath}/js/jquery-3.6.1.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
</head>
<body>
    <h1>Sign Up</h1>
    <form id="signup-form">
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" id="firstName" required>
        <br>
        <label for="lastName">LastName:</label>
        <input type="text" name="LastName" id="lastName" required>
        <br>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>
        <br>
        <label for="user-type">User Type:</label>
        <select name="user-type" id="user-type" required>
            <option value="1">Student</option>
            <option value="2">Tutor</option>
        </select>
        <br>
        <input type="submit" value="Sign Up">
    </form>

<script>
    $(function() {
        $("#signup-form").submit(function(event) {
            event.preventDefault();
            var firstName = $("#firstName").val();
            var lastName = $("#lastName").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var userType = $("#user-type").val();

            $.ajax({
                type: "POST",
                url: "/system/signUp",
                data: {
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    password: password,
                    userType: userType
                },
                success: function(response) {
                    alert("Sign up successful!");
                    window.location.href = "<%=request.getContextPath()%>/login";
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

