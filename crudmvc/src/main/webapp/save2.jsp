<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Form</title>
    
    <style>
        <%@include file="Component/save2css.jsp"%>
    </style>
</head>
<body>
    <form id="studentform" method="post">
        <label for="name">First Name:</label>
        <input type="text" name="firstname" id="firstname" required="required">
        <br>
        <label for="age">Last Name:</label>
        <input type="text" name="lastname" id="lastname" required="required">
        <br>
        <label for="address">Street:</label>
        <input type="text" name="street" id="street" required="required">
        <label for="address">City:</label>
        <input type="text" name="city" id="city" required="required">
        <br>
        <button type="submit">Save</button>
        <button type="reset">Cancel</button>
    </form> 

    <div id="formDetails"></div>
    
    <script>
        document.getElementById('studentform').addEventListener('submit', function(event) {
            event.preventDefault();

            var firstname = document.getElementById('firstname').value;
            var lastname = document.getElementById('lastname').value;
            var street = document.getElementById('street').value;
            var city = document.getElementById('city').value;

            var employeeData = {
                firstname: firstname,
                lastname: lastname,
                street: street,
                city: city
            };

            var jsonData = JSON.stringify(employeeData);

            fetch('http://localhost:8080/saveaddress', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Saved:', data);

                alert('Data saved successfully!');

                document.getElementById('firstname').value = '';
                document.getElementById('lastname').value = '';
                document.getElementById('street').value = '';
                document.getElementById('city').value = '';

                fetch('http://localhost:8080/jasperxls/export', {
                    method: 'POST', 
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: jsonData
                })
                .then(response => response.blob())
                .then(blob => {
                    var downloadLink = document.createElement('a');
                    downloadLink.href = window.URL.createObjectURL(blob);
                    downloadLink.download = 'report.xls';
                    downloadLink.click();
                })
                .catch(error => {
                    console.error('Error downloading XLS file:', error);
                    alert('Error downloading XLS file!');
                });

                fetch('http://localhost:8080/getAddress')
                .then(response => response.json())
                .then(data => {
                    var formDetailsDiv = document.getElementById('formDetails');
                    formDetailsDiv.innerHTML = "<h2>Report Data:</h2>";
                    data.forEach(function(item) {
                        formDetailsDiv.innerHTML += "<p>First Name: " + item.firstname + "</p>" +
                                                    "<p>Last Name: " + item.lastname + "</p>" +
                                                    "<p>Street: " + item.street + "</p>" +
                                                    "<p>City: " + item.city + "</p><br>";
                    });
                })
                .catch(error => {
                    console.error('Error fetching form details:', error);
                    alert('Error fetching form details!');
                });
            })
            .catch(error => {
                console.error('Error saving data:', error);
                alert('Error saving data!');
            });
        });
    </script>
</body>
</html>
