<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Form</title>
</head>
<body>
    <form id="studentform" method="post">
        <label for="name">Name : </label>
        <input type="text" name="name" id="name" required="required">
        <br>
        <label for="age">Age : </label>
        <input type="text" name="age" id="age" required="required">
        <br>
        <label for="address">Address : </label>
        <input type="text" name="address" id="address" required="required">
        <br>
    		<button type="submit">Save</button>
        <button type="reset">Cancel</button>
    </form>          
    <script>
        document.getElementById('studentform').addEventListener('submit', function(event) {
            event.preventDefault(); 
            
            var name = document.getElementById('name').value;
            var age = document.getElementById('age').value;
            var address = document.getElementById('address').value;
            
            var employeeData = {
                name: name,
                age: age,
                address: address
            };
            
var jsonData = JSON.stringify(employeeData);
            
            console.log('JSON data:', jsonData);
            
            fetch('http://localhost:8080/ViewReport', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Response:', data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    </script>

</body>
</html>
