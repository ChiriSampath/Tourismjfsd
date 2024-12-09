<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spot Added Successful</title>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    padding: 20px;
    color: #0f172a;
}

h2 {
    color: #0c4a6e;
    font-size: 2.2rem;
    margin: 6rem 0 1rem 0;
    font-weight: 700;
    text-align: center;
}

h2 u {
    text-decoration: none;
    border-bottom: 4px solid #0ea5e9;
    padding-bottom: 5px;
}

.message-container {
    background: white;
    padding: 2rem;
    border-radius: 20px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
                0 2px 4px -1px rgba(0, 0, 0, 0.06);
    width: 100%;
    max-width: 600px;
    text-align: center;
    margin: 0 auto;
}

.message-container a {
    color: #0284c7;
    text-decoration: none;
    font-weight: 500;
    font-size: 1rem;
    margin-top: 1rem;
    display: inline-block;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    transition: all 0.3s ease;
}

.message-container a:hover {
    background-color: rgba(0, 132, 199, 0.1);
    transform: translateY(-1px);
}

.message-container .message {
    margin: 1rem auto;
    text-align: center;
    padding: 0.8rem;
    border-radius: 10px;
    font-weight: 500;
    width: 100%;
    max-width: 600px;
}

.message-container .message.success {
    background-color: #d1fae5;
    color: #047857;
}

.message-container .message.error {
    background-color: #fee2e2;
    color: #b91c1c;
}

</style>
</head>
<body>

    <div class="message-container">
        <h2>Spot Added Successfully!</h2>
        <div class="message success">
            <c:out value="${message}"></c:out>
        </div>
        <br><br>
        <a href="addspots">Go Back</a>
    </div>

</body>
</html>
