<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tourist Login</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
            color: #0f172a;
        }

        /* Navbar Styles */
        .navbar {
            width: 100%;
            background: linear-gradient(to right, #0284c7, #0ea5e9);
            padding: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-weight: 500;
            margin: 0 0.5rem;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-1px);
        }

        /* Page Titles */
        h3 {
            color: #0c4a6e;
            font-size: 2.2rem;
            margin: 6rem 0 1rem 0;
            font-weight: 700;
            text-align: center;
            position: relative;
        }

        h3 u {
            text-decoration: none;
            border-bottom: 4px solid #0ea5e9;
            padding-bottom: 5px;
        }

        h4 {
            color: #ef4444;
            font-size: 1rem;
            margin: 0.5rem 0 1.5rem 0;
            font-weight: 500;
            text-align: center;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            background-color: rgba(239, 68, 68, 0.1);
            max-width: 80%;
            margin-left: auto;
            margin-right: auto;
        }

        /* Form Container */
        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
                        0 2px 4px -1px rgba(0, 0, 0, 0.06);
            width: 100%;
            max-width: 450px;
            margin: 0 auto;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1),
                        0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        /* Form Elements */
        .form-container table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 1.2rem;
        }

        .form-container label {
            color: #334155;
            font-weight: 500;
            font-size: 0.95rem;
            display: block;
            margin-bottom: 0.5rem;
        }

        /* Input Fields */
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8fafc;
        }

        .form-container input:focus {
            outline: none;
            border-color: #0ea5e9;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.1);
        }

        /* Button Container */
        .button-container {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 1rem;
        }

        /* Buttons */
        .form-container input[type="submit"],
        .form-container input[type="reset"] {
            padding: 0.875rem 1.5rem;
            border-radius: 10px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            min-width: 120px;
        }

        .form-container input[type="submit"] {
            background-color: #0284c7;
            color: white;
            flex: 1;
            max-width: 160px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0369a1;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(2, 132, 199, 0.2);
        }

        .form-container input[type="reset"] {
            background-color: #f1f5f9;
            color: #475569;
            flex: 1;
            max-width: 160px;
        }

        .form-container input[type="reset"]:hover {
            background-color: #e2e8f0;
            transform: translateY(-1px);
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container {
            animation: fadeIn 0.6s ease-out;
        }

        /* Responsive Design */
        @media (max-width: 640px) {
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            h3 {
                font-size: 1.8rem;
                margin: 5rem 0 1rem 0;
            }

            h4 {
                font-size: 0.9rem;
                max-width: 90%;
            }

            .button-container {
                flex-direction: column;
            }

            .form-container input[type="submit"],
            .form-container input[type="reset"] {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>
    <h3><u>Tourist Login</u></h3>

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <div class="form-container">
        <form method="post" action="checktourlogin">
            <table>
                <tr>
                    <td><label for="eemail">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="eemail" required/></td>
                </tr>
                <tr>
                    <td><label for="epwd">Enter Password</label></td>
                    <td><input type="password" id="epwd" name="epwd" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
