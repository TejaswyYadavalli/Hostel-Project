<%-- 
    Document   : adminOPDB1
    Created on : Oct 15, 2015, 8:45:15 AM
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

            String user = request.getParameter("user1");
            String uname = request.getParameter("uname1");
            PreparedStatement ps1 = con.prepareStatement("delete from users where uname=? and user=?");
            ps1.setString(1, user);
            ps1.setString(2, uname);
            String qry = "delete from users where user='" + user + "' and uname= '"+ uname +"'";
            int i = stmt.executeUpdate(qry);
            if (i > 0) {
    %>
   
    <script>
        alert("Successfully Deleted.");
        window.location.href = "adminOP.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Deletion failed.");
        window.location.href = "adminOP.jsp";
    </script>
    <%
            }
           

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>  

</html>
