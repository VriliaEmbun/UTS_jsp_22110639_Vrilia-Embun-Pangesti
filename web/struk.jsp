<%@ page import="java.util.*" %>
<%
    String nama = request.getParameter("nama");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    String filmDipilih = request.getParameter("film");
    String jamTayang = request.getParameter("jam");

    List<String[]> films = (List<String[]>) application.getAttribute("filmList");
    int harga = 0;

    for (String[] film : films) {
        if (film[0].equals(filmDipilih)) {
            harga = Integer.parseInt(film[3]);
            break;
        }
    }

    int total = jumlah * harga;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Tiket Bioskop</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 40px 15px;
            height: 100vh;
            background: linear-gradient(-45deg, #6a11cb, #2575fc, #6a11cb, #2575fc);
            background-size: 400% 400%;
            animation: gradientBG 12s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .ticket {
            max-width: 600px;
            background: rgba(255, 255, 255, 0.93);
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.35);
            padding: 30px 25px;
            font-family: 'Share Tech Mono', monospace;
            position: relative;
            color: #2c3e50;
        }

        .ticket::before, .ticket::after {
            content: "";
            position: absolute;
            width: 20px;
            height: 20px;
            background: #e0e0e0;
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        .ticket::before {
            left: -10px;
        }

        .ticket::after {
            right: -10px;
        }

        .ticket-header {
            border-bottom: 2px dashed #aaa;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .ticket-header h2 {
            font-weight: 700;
            font-size: 26px;
            margin: 0;
            color: #6a11cb;
        }

        .ticket-body table {
            width: 100%;
        }

        .ticket-body th {
            text-align: left;
            width: 40%;
            padding: 8px 0;
            color: #666;
        }

        .ticket-body td {
            padding: 8px 0;
            font-weight: 600;
            color: #2c3e50;
        }

        .barcode {
            margin-top: 25px;
            text-align: center;
        }

        .barcode img {
            max-width: 150px;
            border-radius: 8px;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
        }

        .btn-custom {
            margin: 0 10px;
            font-weight: 600;
            border-radius: 50px;
            padding: 10px 25px;
            transition: all 0.3s ease;
        }

        .btn-custom.btn-primary {
            background-color: #6a11cb;
            color: #fff;
            border: none;
        }

        .btn-custom.btn-primary:hover {
            background-color: #5a0eb4;
            transform: translateY(-2px);
        }

        .btn-custom.btn-danger {
            background-color: #c0392b;
            color: #fff;
            border: none;
        }

        .btn-custom.btn-danger:hover {
            background-color: #962d22;
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            body {
                padding: 20px 10px;
            }

            .ticket {
                padding: 25px 20px;
            }

            .ticket-header h2 {
                font-size: 22px;
            }

            .barcode img {
                max-width: 120px;
            }
        }
    </style>
</head>
<body>
    <div class="ticket">
        <div class="ticket-header">
            <h2>TIKET PESANAN ANDA</h2>
        </div>

        <div class="ticket-body">
            <table>
                <tr>
                    <th>Nama Pemesan</th>
                    <td><%= nama %></td>
                </tr>
                <tr>
                    <th>Film</th>
                    <td><%= filmDipilih %></td>
                </tr>
                <tr>
                    <th>Jam Tayang</th>
                    <td><%= jamTayang %></td>
                </tr>
                <tr>
                    <th>Jumlah Tiket</th>
                    <td><%= jumlah %></td>
                </tr>
                <tr>
                    <th>Total Harga</th>
                    <td>Rp <%= String.format("%,d", total).replace(',', '.') %></td>
                </tr>
            </table>

            <div class="barcode">
                <img src="https://api.qrserver.com/v1/create-qr-code/?data=<%= nama %>_<%= filmDipilih %>_<%= jamTayang %>&size=100x100" alt="barcode">
            </div>
        </div>

        <div class="actions">
            <a href="index.jsp" class="btn btn-custom btn-primary">Beranda</a>
            <a href="dologout.jsp" class="btn btn-custom btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>
