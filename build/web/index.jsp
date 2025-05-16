<%@ page import="java.util.*" %>
<%
    List<String[]> films = new ArrayList<>();
    // Format: Judul, Genre, Durasi, Harga, Jam Tayang, URL Poster
    films.add(new String[]{"FINAL DESTINATION", "Thriller", "110", "50000", "10:00,13:30,17:00,20:30", "https://www.vitalthrills.com/wp-content/uploads/2025/02/finaldest1.jpg"});
    films.add(new String[]{"GODAAN SETAN YANG TERKUTUK", "Horror", "88", "50000", "10:00,13:30,17:00,20:30", "https://cdn.antaranews.com/cache/1200x800/2025/04/21/Picsart_25-04-21_09-31-44-251.jpg.webp"});
    films.add(new String[]{"PEMBANTAIAN DUKUN SANTET", "Horror", "92", "50000", "10:00,13:30,17:00,20:30", "https://m.media-amazon.com/images/M/MV5BNDIwM2VjMzYtYjhhMS00YmVhLWJmNDgtNmRmYjhlMjViMTllXkEyXkFqcGc@._V1_.jpg"});

    application.setAttribute("filmList", films);
%>
<!DOCTYPE html>
<html>
<head>
    <title> DAFTAR FILEM KU</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 40px 20px;
            color: #fff;
        }

        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card-img-top {
            height: 320px;
            object-fit: cover;
        }

        .card-body {
            background-color: #ffffff;
            color: #333;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.25rem;
        }

        .btn-primary {
            background-color: #764ba2;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #5a368a;
        }

        h2 {
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            color: #fff;
        }

        @media (max-width: 480px) {
            .card-img-top {
                height: 220px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Film yang Tersedia</h2>
    <div class="row">
        <% for (String[] film : films) { %>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="<%= film[5] %>" class="card-img-top" alt="Poster <%= film[0] %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= film[0] %></h5>
                        <p><strong>Genre:</strong> <%= film[1] %></p>
                        <p><strong>Durasi:</strong> <%= film[2] %> menit</p>
                        <p><strong>Harga:</strong> Rp <%= film[3] %></p>
                        <p><strong>Jam Tayang:</strong> <%= film[4] %></p>
                        <a href="formPesan.jsp?judul=<%= film[0] %>" class="btn btn-primary btn-block">Pesan Tiket</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
