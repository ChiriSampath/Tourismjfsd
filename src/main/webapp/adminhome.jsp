<!DOCTYPE html>
<html>
<head>
    <title>Tourism Management System - Admin</title>
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

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
            background-color: #f5f7fb;
        }

        .admin-container {
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

        .stats-card .trend {
            color: #27ae60;
            font-size: 0.9em;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .recent-activity {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .activity-list {
            list-style: none;
        }

        .activity-item {
            padding: 15px;
            border-bottom: 1px solid #f0f2f5;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: #e8f4ff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #3498db;
        }

        .activity-details h4 {
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .activity-details p {
            color: #666;
            font-size: 0.9em;
        }

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
    <div class="navbar">
        <div class="navbar-brand">
            <h2>TOURISM MANAGEMENT SYSTEM</h2>
        </div>
        <a href="adminhome" class="active">
            <i class="fas fa-home"></i>
            <span>Home</span>
        </a>
        <a href="addspots">
            <i class="fas fa-plus-circle"></i>
            <span>Add Spots</span>
        </a>
        <a href="viewalltourists">
            <i class="fas fa-users"></i>
            <span>View Tourists</span>
        </a>
        <!-- Removed Update Tourist Link -->
        <a href="updatespot">
            <i class="fas fa-edit"></i>
            <span>Update Spot</span>
        </a>
        <a href="deletetour">
            <i class="fas fa-trash-alt"></i>
            <span>Delete Tourists</span>
        </a>
        <a href="adminlogout">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
        </a>
    </div>

    <div class="main-content">
        <div class="admin-container">
            <div class="welcome-section">
                <h1>Welcome, Admin!</h1>
                <p>Here's your tourism management dashboard overview</p>
            </div>

            <div class="dashboard-grid">
                <div class="stats-card">
                    <h3><i class="fas fa-map-marker-alt"></i> Total Tourist Spots</h3>
                    <div class="number">125</div>
                    <div class="trend"><i class="fas fa-arrow-up"></i> 12% increase</div>
                </div>

                <div class="stats-card">
                    <h3><i class="fas fa-users"></i> Total Tourists</h3>
                    <div class="number">1,234</div>
                    <div class="trend"><i class="fas fa-arrow-up"></i> 8% increase</div>
                </div>

                <div class="stats-card">
                    <h3><i class="fas fa-ticket-alt"></i> Active Bookings</h3>
                    <div class="number">456</div>
                    <div class="trend"><i class="fas fa-arrow-up"></i> 15% increase</div>
                </div>
            </div>

            <div class="recent-activity">
                <h3>Recent Activities</h3>
                <ul class="activity-list">
                    <li class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-details">
                            <h4>New Tourist Registration</h4>
                            <p>John Doe registered as a new tourist</p>
                            <small>2 minutes ago</small>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <div class="activity-details">
                            <h4>New Spot Added</h4>
                            <p>Paradise Beach added to tourist spots</p>
                            <small>1 hour ago</small>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-bookmark"></i>
                        </div>
                        <div class="activity-details">
                            <h4>New Booking</h4>
                            <p>Mountain Trek Tour booked by Sarah Smith</p>
                            <small>3 hours ago</small>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
