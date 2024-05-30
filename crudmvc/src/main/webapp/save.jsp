<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="Component/studentformcss.jsp"%>
</style>
</head>
<body>
    <div class="heading">
        <h1>Add the Details Here</h1>
    </div>
      <div id="imageContainer"></div>
    <div id="formContainer">
        <form id="studentform"  method="post">
            Enter name: <input type="text" name="name" id="name"><br>
            Enter age: <input type="number" name="age" id="age" >
            Enter address: <input type="text" name="address" id="address">
            <input type="file" id="imageInput" accept="image/*">
            <!-- <button type="button" id="uploadBtn">Upload</button> -->
            <button type="submit" id="submitBtn">Submit</button>
            <button type="button"><a href="home.jsp">Cancel</a></button>
        </form>
    </div>
    <div class="link">
        <a href="home.jsp">Back to Home</a>
    </div>
    <script>
    <%-- <%@include file="Component/savescript.jsp"%> --%>
    /* document.getElementById('uploadBtn').addEventListener('click', function() {
        const fileInput = document.getElementById('imageInput');
        const file = fileInput.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function(e) {
            const image = document.createElement('img');
            image.src = e.target.result;
            document.getElementById('imageContainer').innerHTML = '';
            document.getElementById('imageContainer').appendChild(image);
          }
          reader.readAsDataURL(file);
        } else {
          alert('Please select an image.');
        }
      }); */
      
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
        
        fetch('http://localhost:8080/savestudent', {
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




	<!-- -- Enter Section: <input type="text" <!-- ------onclick="return restcall1() --------  name="section" id="section"oninput="validateSection(event)"><br>
            Select Gender <br> 
            Male : <input type="radio" name="gender" value="male" class="gender"><br>
            Female : <input type="radio" name="gender" value="female" class="gender"><br> -onsubmit="return validateForm() -->-

