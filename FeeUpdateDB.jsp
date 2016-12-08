<%-- 
    Document   : FeeUpdateDB
    Created on : 16-Sep-2015, 06:44:10
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
        <title>JSP Page</title>
    </head>
    <%
        try {
            String rno = request.getParameter("rno1");
            String accno = request.getParameter("accno");
            String month = request.getParameter("select");
            String year = request.getParameter("select1");
            String mbill = request.getParameter("mbill");
            String esst = request.getParameter("esst");
            String rent = request.getParameter("Rrent");
            String wecharges = request.getParameter("wecharges");
            String food = request.getParameter("ftype");
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE feedetails SET rno = ?, accno = ?, month = ?, year = ?, mbill = ?, esst = ?, rent = ?, wecharges = ?, food = ? WHERE rno = ?");
            ps.setString(1, rno);
            ps.setString(2, accno);
            ps.setString(3, month);
            ps.setString(4, year);
            ps.setString(5, mbill);
            ps.setString(6, esst);
            ps.setString(7, rent);
            ps.setString(8, wecharges);
            ps.setString(9, food);
            ps.setString(10, rno);
            int i = ps.executeUpdate();
            if (i > 0) {

    %>
    <script>
        alert("Successfully Updated.");
        window.location.href = "clerk.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Updation failed.Try Again");
        window.location.href = "FeeUpdate.jsp";
    </script>
    <%
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>
</html>

