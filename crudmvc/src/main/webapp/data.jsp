<%@page import="crudmvc.dto.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Records</title>
<style>
    <%@include file="Component/datacss.jsp"%>
</style>
</head>
<body>
    <h1>Welcome to Student Records </h1>
    <p>This records allows you to manage student records efficiently.</p>
    <table border="1px">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Section</th>
            <th>Gender</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        <c:forEach var="s" items="${list}">
            <tr>
                <td>${s.getId()}</td>
                <td>${s.getName()}</td>
                <td>${s.getSection()}</td>
                <td>${s.getGender()}</td>
                <td><a href="delete?id=${s.getId()}"><button>Delete</button></a></td>
                <td><a href="edit?id=${s.getId()}"><button>Update</button></a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="link">
        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>
