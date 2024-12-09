<%@ page import="com.klef.jfsd.sdpproject.model.Tourist" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tourist Profile - Tourism Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
            display: flex;
        }

        .navbar {
            width: 250px;
            background: linear-gradient(180deg, #2c3e50 0%, #2c3e50 100%);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 20px;
            color: white;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 15px 25px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            margin: 8px 0;
            font-weight: 500;
            gap: 10px;
        }

        .navbar a:hover {
            background: rgba(255,255,255,0.1);
            padding-left: 30px;
        }

        .navbar a.active {
            background: #3498db;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
        }

        .profile-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h1 {
            color: #2c3e50;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .profile-details {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 20px;
            color: #2c3e50;
        }

        .profile-details .label {
            font-weight: 600;
            color: #3498db;
        }

        .profile-details .value {
            color: #666;
        }

        .profile-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .action-button {
            background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .action-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .session-expired {
            text-align: center;
            color: #e74c3c;
            padding: 20px;
            background-color: #f8d7da;
            border-radius: 10px;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .navbar {
                width: 70px;
                padding-top: 10px;
            }

            .main-content {
                margin-left: 70px;
            }
        }
    </style>
</head>
<body>
    <%
        // Validate session and retrieve tourist details
        Tourist tourist = (Tourist) session.getAttribute("tourist");
        boolean sessionValid = (tourist != null);

        if (!sessionValid) {
            response.sendRedirect("touristsessionexpiry");
            return;
        }
    %>

    <% if (sessionValid) { %>
        <%@ include file="touristnavbar.jsp" %>
        <div class="main-content">
            <div class="profile-container">
                <div class="profile-card">
                    <div class="profile-header">
                        <h1>My Profile</h1>
                    </div>
                    <div class="profile-details">
                        <div class="label">Tourist ID:</div>
                        <div class="value"><%= tourist.getId() %></div>

                        <div class="label">Name:</div>
                        <div class="value"><%= tourist.getName() %></div>

                        <div class="label">Gender:</div>
                        <div class="value"><%= tourist.getGender() %></div>

                        <div class="label">Date of Birth:</div>
                        <div class="value"><%= tourist.getDateofbirth() %></div>

                        <div class="label">Email:</div>
                        <div class="value"><%= tourist.getEmail() %></div>

                        <div class="label">Contact:</div>
                        <div class="value"><%= tourist.getContact() %></div>
                    </div>
                </div>
            </div>
        </div>
    <% } else { %>
        <div class="main-content">
            <div class="profile-container">
                <div class="session-expired">
                    <h2>Session Expired</h2>
                    <p>Your session has timed out. Please log in again.</p>
                    <a href="touristlogin" class="action-button">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </div>
            </div>
        </div>
    <% } %>
</body>
</html>
