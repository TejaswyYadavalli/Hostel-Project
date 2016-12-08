<%-- 
    Document   : adminOPDB
    Created on : Oct 14, 2015, 2:10:41 PM
    Author     : tejaswy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
    </head>
    <%
        try {
            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();

            String user = request.getParameter("user");
            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            String password = request.getParameter("pwd");
            String password1 = request.getParameter("rpwd");

            PreparedStatement ps1 = con.prepareStatement("select * from users where uname=?");
            ps1.setString(1, uname);
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {

    %>
    <script>
        alert("Username already exists.");
        window.location.href = "adminOP.jsp";
    </script>
    <%} else {
        if (password.equals(password1)) {

            String qry = "insert into users(user,uname,email,password) values('" + user + "','" + uname + "','" + email + "','" + password + "')";
            int i = stmt.executeUpdate(qry);
            if (i > 0) {
    %>
    <script>
        alert("Successfully Inserted.");
        window.location.href = "adminOP.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Insertion failed.");
        window.location.href = "adminOP.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("Passwords don't match.");;
        window.location.href = "adminOP.jsp";
    </script>
    <%
                }
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>  
</html>
