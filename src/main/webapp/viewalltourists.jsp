<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script>
    const sessionTimeout = 15 * 60 * 1000; // 15 minutes in milliseconds

    // Function to handle session expiry
    function handleSessionExpiry() {
        alert("Your session has expired due to inactivity.");
        window.location.href = '/adminlogin'; // Redirect to the admin login page after session expires
    }

    // Set a timer to call the function after 15 minutes
    setTimeout(handleSessionExpiry, sessionTimeout);
    
    // Reset session timer on user interaction (mouse movement, key press, etc.)
    let timeoutTimer;
    document.onmousemove = document.onkeypress = function() {
        clearTimeout(timeoutTimer);
        timeoutTimer = setTimeout(handleSessionExpiry, sessionTimeout);
    };
    </script>
    <meta charset="UTF-8">
    <title>View All Tourists</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 0 1rem;
        }

        .container {
            max-width: 800px;
            width: 100%;
            padding: 2rem;
            background-color: white;
            color: black;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #34495e;
            margin-bottom: 2rem;
            text-align: center;
            font-size: 2.5rem;
            letter-spacing: 1px;
        }

        .content-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            color: black;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h3 {
            text-align: center;
            color: black;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1.8rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: black;
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        table th {
            background-color: black;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            padding: 12px;
            text-align: left;
            letter-spacing: 0.5px;
        }

        table td {
            padding: 12px;
            border: 1px solid #ddd;
            font-size: 1rem;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #333;
        }

        table tr:hover {
            background-color: #444;
            transition: background-color 0.3s ease;
        }

        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 4px;
            background-color: black;
            border: 1px solid white;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: white;
            color: black;
        }

        @media screen and (max-width: 768px) {
            .content-wrapper {
                padding: 10px;
            }

            table {
                font-size: 14px;
            }

            table th, table td {
                padding: 8px;
            }

            h3 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <h3 style="text-align: center;"><u>View All Tourists</u></h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
        </tr>
        <c:forEach items="${tourlist}" var="tour">
            <tr>
                <td><c:out value="${tour.id}"/></td>
                <td><c:out value="${tour.name}"/></td>
                <td><c:out value="${tour.gender}"/></td>
                <td><c:out value="${tour.dateofbirth}"/></td>
                <td><c:out value="${tour.email}"/></td>
                <td><c:out value="${tour.contact}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
