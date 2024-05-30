<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Information</title>
<style>
    <%@include file="Component/updatecss.jsp"%>
</style>
</head>
<body>
    <form:form action="update" modelAttribute="student" method="post">
        <label for="id">Enter Id:</label>
        <form:input path="id" readonly="true" /><br>
        <label for="name">Enter Name:</label>
        <form:input path="name" /><br>
        <label for="section">Enter Section:</label>
        <form:input path="section" /><br>
        <label for="gender">Select Gender:</label>
        <form:radiobutton path="gender" value="male" /> Male
        <form:radiobutton path="gender" value="female" /> Female<br>
        <button>Update</button>
        <button type="reset">Cancel</button>
    </form:form>
    <div class="link">
        <a href="home.jsp">Back to Home</a>
    </div>
    
</body>
</html>
