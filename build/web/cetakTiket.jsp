<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    String username = (String) session.getAttribute("username");
    String nama = (String) session.getAttribute("nama");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String bookingId = (String) session.getAttribute("bookingId");
    String namaPemesan = (String) session.getAttribute("namaPemesan");
    String filmJudul = (String) session.getAttribute("filmJudul");
    String jamTayang = (String) session.getAttribute("jamTayang");
    Integer jumlahTiket = (Integer) session.getAttribute("jumlahTiket");
    String tanggalPemesanan = (String) session.getAttribute("tanggalPemesanan");

    if (bookingId == null || namaPemesan == null || filmJudul == null ||
        jamTayang == null || jumlahTiket == null) {
        response.sendRedirect("formPesan.jsp");
        return;
    }

    LocalDate tomorrow = LocalDate.now().plusDays(1);
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, dd MMMM yyyy");
    String tanggalTayang = tomorrow.format(formatter);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cetak Tiket - Bioskop Online</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Share+Tech+Mono&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            font-family: 'Roboto', sans-serif;
            color: #fff;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
        }

        header h1 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #1c1c1c;
            padding: 10px 20px;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        nav ul li a {
            color: #ffc107;
            text-decoration: none;
            font-weight: 600;
        }

        .user-info {
            color: #ccc;
        }

        .ticket {
            background: #ffffff0f;
            border-left: 5px solid #ffc107;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            position: relative;
        }

        .ticket h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #ffc107;
        }

        .ticket-info p {
            margin: 5px 0;
        }

        .barcode {
            font-family: 'Share Tech Mono', monospace;
            font-size: 1.2rem;
            margin-top: 15px;
            text-align: right;
            letter-spacing: 3px;
            color: #ccc;
        }

        .print-btn {
            text-align: center;
            margin-top: 40px;
        }

        .btn {
            background: #ffc107;
            border: none;
            color: #000;
            padding: 12px 25px;
            font-weight: bold;
            margin: 10px;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background: #e0a800;
        }

        @media print {
            nav, .print-btn {
                display: none;
            }

            body {
                background: #fff;
                color: #000;
            }

            .ticket {
                box-shadow: none;
                border: 1px solid #000;
                color: #000;
            }

            .barcode {
                color: #000;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>🎫 Cetak Tiket Anda</h1>
    </header>

    <nav>
        <ul>
            <li><a href="index.jsp">Beranda</a></li>
            <li><a href="formPesan.jsp">Pesan Tiket</a></li>
        </ul>
        <div class="user-info">
            Hai, <%= nama %> | <a href="logout.jsp" style="color:#f66;">Logout</a>
        </div>
    </nav>

    <div class="container">
        <% for (int i = 0; i < jumlahTiket; i++) { %>
            <div class="ticket">
                <h3>BIOSKOP ONLINE</h3>
                <div class="ticket-info">
                    <p><strong>ID:</strong> <%= bookingId %>-<%= i+1 %></p>
                    <p><strong>Film:</strong> <%= filmJudul %></p>
                    <p><strong>Tanggal:</strong> <%= tanggalTayang %></p>
                    <p><strong>Jam:</strong> <%= jamTayang %></p>
                    <p><strong>Nama:</strong> <%= namaPemesan %></p>
                    <p><strong>Seat:</strong> Unreserved</p>
                </div>
                <div class="barcode">
                    <%= bookingId %>-<%= i+1 %>
                </div>
                <div style="text-align: center; font-size: 12px; margin-top: 10px;">
                    Silakan tukarkan tiket ini di loket bioskop
                </div>
            </div>
        <% } %>

        <div class="print-btn">
            <button onclick="window.print()" class="btn">🖨️ Print Tiket</button>
            <a href="index.jsp" class="btn">🏠 Kembali ke Beranda</a>
        </div>
    </div>
</body>
</html>
