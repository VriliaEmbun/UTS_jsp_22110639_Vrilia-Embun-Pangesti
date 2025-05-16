<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus semua data session
    session.invalidate();

    // Redirect ke halaman login
    response.sendRedirect("login.jsp");
%>

