<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tourism Management System - Tourist Dashboard</title>
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

        /* Vertical Navbar Styles */
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

        .navbar-brand {
            text-align: center;
            padding: 20px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }

        .navbar-brand h2 {
            color: white;
            font-size: 1.2em;
            line-height: 1.4;
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

        .navbar a i {
            width: 20px;
            text-align: center;
        }

        .navbar a:hover {
            background: rgba(255,255,255,0.1);
            padding-left: 30px;
        }

        .navbar a.active {
            background: #3498db;
        }

        /* Main Content Area */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
            background-color: #f5f7fb;
        }

        .tourist-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .welcome-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .welcome-section h1 {
            color: #2c3e50;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .welcome-section p {
            color: #666;
            font-size: 1.1em;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-5px);
        }

        .stats-card h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 1.2em;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .stats-card .number {
            font-size: 2.5em;
            font-weight: bold;
            color: #3498db;
            margin: 10px 0;
        }

        .upcoming-tours {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .tour-list {
            list-style: none;
        }

        .tour-item {
            padding: 15px;
            border-bottom: 1px solid #f0f2f5;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .tour-icon {
            width: 40px;
            height: 40px;
            background: #e8f4ff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #3498db;
        }

        .tour-details h4 {
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .tour-details p {
            color: #666;
            font-size: 0.9em;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .action-button {
            background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
            color: white;
            border: none;
            padding: 15px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .action-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .navbar {
                width: 70px;
                padding-top: 10px;
            }

            .navbar-brand {
                padding: 10px 5px;
            }

            .navbar-brand h2 {
                display: none;
            }

            .navbar a span {
                display: none;
            }

            .navbar a {
                padding: 15px;
                justify-content: center;
            }

            .navbar a:hover {
                padding-left: 15px;
            }

            .main-content {
                margin-left: 70px;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <script>
        // Set the session timeout to 15 minutes (900,000 milliseconds)
        const sessionTimeout = 45 * 1000; // 15 minutes in milliseconds

        // Function to handle session expiry
        function handleSessionExpiry() {
            alert("Your session has expired due to inactivity.");
            window.location.href = '/touristlogin'; // Redirect to the login page after session expires
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
</head>
<body>
    <%@ include file="touristnavbar.jsp" %>

    <div class="main-content">
        <div class="tourist-container">
            <div class="welcome-section">
                <h1>Welcome, Tourist!</h1>
                <p>Explore amazing destinations and create unforgettable memories</p>
            </div>

            <div class="dashboard-grid">
                <div class="stats-card">
                    <h3><i class="fas fa-map-marked-alt"></i> Explored Spots</h3>
                    <div class="number">12</div>
                </div>

                <div class="stats-card">
                    <h3><i class="fas fa-ticket-alt"></i> Booked Tours</h3>
                    <div class="number">3</div>
                </div>

                <div class="stats-card">
                    <h3><i class="fas fa-heart"></i> Favorite Spots</h3>
                    <div class="number">6</div>
                </div>
            </div>

            <div class="upcoming-tours">
                <h3>Upcoming Tours</h3>
                <ul class="tour-list">
                    <li class="tour-item">
                        <div class="tour-icon">
                            <i class="fas fa-mountain"></i>
                        </div>
                        <div class="tour-details">
                            <h4>Mountain Trek Adventure</h4>
                            <p>Scheduled for May 15, 2024</p>
                        </div>
                    </li>
                    <li class="tour-item">
                        <div class="tour-icon">
                            <i class="fas fa-umbrella-beach"></i>
                        </div>
                        <div class="tour-details">
                            <h4>Tropical Beach Getaway</h4>
                            <p>Scheduled for June 22, 2024</p>
                        </div>
                    </li>
                    <li class="tour-item">
                        <div class="tour-icon">
                            <i class="fas fa-city"></i>
                        </div>
                        <div class="tour-details">
                            <h4>City Cultural Tour</h4>
                            <p>Scheduled for July 10, 2024</p>
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</body>
</html>
