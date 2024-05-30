<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   <%@include file="Component/homecss.jsp"%>
</style>
</head>
<body>
<nav>
    <a href="#" >Home</a>
    <a href="#" >About Us</a>
    <a href="#">Contact US</a>
</nav>
<div class="container">
    <div class="jumbotron">
        <h1 class="text-center">Student Record</h1>
        <p class="lead text-center">Welcome to the student records system. You can add new students or view existing data using the buttons below.</p>
        <div class="text-center">
            <a href="load" class="btn btn-primary">Add Student</a>
            <a href="fetch" class="btn btn-success">View Existing Data</a> 
        </div>
    </div>
</div>
</body>
</html>
