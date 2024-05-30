<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report</title>
</head>
<body>
    <h1>Report Data</h1>
    <div id="reportData">
        <%-- This is where the report data will be dynamically inserted --%>
    </div>

    <button id="generatePDF">Generate PDF</button>

    <script>
        // Function to generate PDF
        function generatePDF() {
            // Fetch data from getAddress endpoint
            fetch('http://localhost:8080/getAddress')
            .then(response => response.json())
            .then(data => {
                // Display data from the report in the UI
                var reportDataDiv = document.getElementById('reportData');
                reportDataDiv.innerHTML = "<h2>Report Data:</h2>";
                data.forEach(function(item) {
                    reportDataDiv.innerHTML += "<p>First Name: " + item.firstname + "</p>" +
                                               "<p>Last Name: " + item.lastname + "</p>" +
                                               "<p>Street: " + item.street + "</p>" +
                                               "<p>City: " + item.city + "</p><br>";
                });

                // Prepare data for PDF generation
                var jsonData = JSON.stringify(data);

                // Send data for PDF generation
                fetch('http://localhost:8080/jasperpdf/export', {
                    method: 'POST', 
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: jsonData
                })
                .then(response => response.blob())
                .then(blob => {
                    // Create a link to download the PDF
                    var downloadLink = document.createElement('a');
                    downloadLink.href = window.URL.createObjectURL(blob);
                    downloadLink.download = 'report.pdf';
                    downloadLink.textContent = 'Download PDF';
                    reportDataDiv.appendChild(downloadLink);
                })
                .catch(error => {
                    console.error('Error generating PDF:', error);
                });
            })
            .catch(error => {
                console.error('Error fetching report data:', error);
            });
        }

        // Call generatePDF function when the button is clicked
        document.getElementById('generatePDF').addEventListener('click', generatePDF);
    </script>
</body>
</html>
