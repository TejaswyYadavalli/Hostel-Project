<%-- 
    Document   : bedAllotmentLoginDB
    Created on : 13 Sep, 2015, 11:29:36 PM
    Author     : tejaswy
--%>

<%@page import="java.sql.*"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room-bed Allotment System</title>
    </head>
    <%
        String user = request.getParameter("dbType");
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        try {
            Connection con = DB.getConnection();

            if (user.equals("Caretaker")) {

                PreparedStatement ps = con.prepareStatement("select * from users where uname=? and password=? and user=?");
                ps.setString(1, uname);
                ps.setString(2, pass);
                ps.setString(3, user);
                ResultSet rs = ps.executeQuery();
                int x = 0;
                while (rs.next()) {
                    if (rs.getString(3).equals(uname) && rs.getString(4).equals(pass) && rs.getString(2).equalsIgnoreCase(user)) {
                        x = 1;
                    } else {
                        x = 2;
                    }
                }
                if (x == 1) {
                    response.sendRedirect("caretakerbed.jsp");

                } else {
    %>
    <script>
        alert("Inavalid Username or Password.Try Again");
        window.location.href="bedAllotmentLogin.jsp";
    </script>
    <%
        }
    } else if (user.equals("Deputywarden")) {

        PreparedStatement ps = con.prepareStatement("select * from users where uname=? and password=? and user=?");
        ps.setString(1, uname);
        ps.setString(2, pass);
        ps.setString(3, user);
        ResultSet rs = ps.executeQuery();
        int x = 0;
        while (rs.next()) {
            if (rs.getString(3).equals(uname) && rs.getString(4).equals(pass) && rs.getString(2).equalsIgnoreCase(user)) {
                x = 1;
            } else {
                x = 2;
            }
        }
        if (x == 1) {
            response.sendRedirect("ba_deputyWarden.jsp");

        } else {
            //out.println("<center>" + "Inavalid Username or Password.Try Again");
    %>
    <script>
        alert("Inavalid Username or Password.Try Again");
        window.location.href="bedAllotmentLogin.jsp";
    </script>
    <%
        }

    } else if (user.equals("Hostelmanager")) {
        PreparedStatement ps = con.prepareStatement("select * from users where uname=? and password=? and user=?");
        ps.setString(1, uname);
        ps.setString(2, pass);
        ps.setString(3, user);
        ResultSet rs = ps.executeQuery();
        int x = 0;
        while (rs.next()) {
            if (rs.getString(3).equals(uname) && rs.getString(4).equals(pass) && rs.getString(2).equalsIgnoreCase(user)) {
                x = 1;
            } else {
                x = 2;
            }
        }
        if (x == 1) {
            response.sendRedirect("baHostelManager.jsp");

        } else {
//out.println("<center>" + "Inavalid Username or Password.Try Again");
    %>
    <script>
        alert("Inavalid Username or Password.Try Again");
        window.location.href="bedAllotmentLogin.jsp";
    </script>
    
    <%
                }

            }
            
            session.setAttribute("unamep", uname);
            session.setAttribute("passp", pass);

        } catch (Exception ex) {
            out.println(ex);
        }
    %>
</html>
