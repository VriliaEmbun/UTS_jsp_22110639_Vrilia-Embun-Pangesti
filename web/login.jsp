<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") != null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login Bioskop</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        /* Animated gradient background */
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(-45deg, #2c3e50, #3498db, #9b59b6, #27ae60);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 380px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            color: #fff;
        }

        .login-container h3 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            color: #ccc;
        }

        .form-control {
            padding-left: 38px;
            background-color: rgba(255,255,255,0.15);
            border: none;
            border-radius: 50px;
            color: #fff;
        }

        .form-control::placeholder {
            color: #ddd;
        }

        .form-control:focus {
            background-color: rgba(255,255,255,0.25);
            box-shadow: 0 0 8px rgba(255,255,255,0.3);
            outline: none;
            color: #fff;
        }

        .btn-login {
            background: #27ae60;
            border: none;
            border-radius: 50px;
            padding: 12px;
            font-weight: bold;
            width: 100%;
            color: white;
            transition: all 0.3s ease-in-out;
        }

        .btn-login:hover {
            background: #219150;
            transform: scale(1.03);
        }

        .alert {
            border-radius: 10px;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-10px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h3>🎟 Login Bioskop</h3>

        <% if ("1".equals(error)) { %>
            <div class="alert alert-danger">Isi semua field terlebih dahulu!</div>
        <% } else if ("2".equals(error)) { %>
            <div class="alert alert-danger">Username atau password salah!</div>
        <% } %>

        <form action="dologin.jsp" method="post" autocomplete="off">
            <div class="form-group">
                <i class="bi bi-person-fill"></i>
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="form-group">
                <i class="bi bi-lock-fill"></i>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-login">Masuk</button>
        </form>
    </div>
</body>
</html>
