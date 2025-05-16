<%@ page import="java.util.*" %>
<%
    List<String[]> films = (List<String[]>) application.getAttribute("filmList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan Tiket</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap + Google Fonts + Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(-45deg, #d16ba5, #c777b9, #ba83ca, #aa8fd8, #9a9ae1, #8aaae5);
            background-size: 500% 500%;
            animation: gradientMove 12s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .form-box {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(8px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 500px;
            color: #000;
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            background-color: #fff;
            border: 1px solid #ccc;
            color: #000;
        }

        .form-control::placeholder {
            color: #888;
        }

        .form-control:focus {
            background-color: #fff;
            box-shadow: 0 0 8px rgba(138, 170, 229, 0.5);
            outline: none;
            color: #000;
        }

        .btn-success {
            background: linear-gradient(to right, #9b59b6, #e91e63);
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            transform: scale(1.05);
            box-shadow: 0 0 12px rgba(231, 76, 133, 0.6);
        }

        .header-icon {
            font-size: 40px;
            color: #9b59b6;
            margin-bottom: 10px;
            text-align: center;
        }

        @media (max-width: 576px) {
            .form-box {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="form-box">
        <div class="header-icon">
            <i class="fas fa-ticket-alt"></i>
        </div>
        <h2>Form Pemesanan Tiket</h2>

        <form action="struk.jsp" method="post">
            <div class="form-group">
                <label>Nama Pemesan:</label>
                <input type="text" name="nama" class="form-control" required placeholder="Masukkan nama Anda">
            </div>

            <div class="form-group">
                <label>Jumlah Tiket:</label>
                <input type="number" name="jumlah" class="form-control" required min="1" placeholder="Jumlah tiket">
            </div>

            <div class="form-group">
                <label>Film:</label>
                <select name="film" class="form-control" required>
                    <option disabled selected>Pilih Film</option>
                    <% for (String[] film : films) { %>
                        <option value="<%= film[0] %>"><%= film[0] %></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Jam Tayang:</label>
                <select name="jam" class="form-control" required>
                    <option disabled selected>Pilih Jam</option>
                    <option value="09:00">10:00</option>
                    <option value="11:30">13:30</option>
                    <option value="14:00">17:00</option>
                    <option value="16:30">20:30</option>
                   
                </select>
            </div>

            <button type="submit" class="btn btn-success btn-block">Cetak Struk</button>
        </form>
    </div>
</body>
</html>
