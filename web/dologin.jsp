<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if(username.equals("vrilia") && password.equals("123")) {
        session.setAttribute("namauser", username);
        response.sendRedirect("index.jsp");
    }
%>
