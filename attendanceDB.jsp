<%-- 
    Document   : caretakerDB
    Created on : 21-Sep-2015, 23:31:37
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
            String selected = request.getParameter("caretaker");
            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();
            String rno = request.getParameter("rno");
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            String days = request.getParameter("pdays");

            if (selected.equals("Submit")) {
                PreparedStatement ps1 = con.prepareStatement("select * from studentdetails where rno=?");
                ps1.setString(1, rno);
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {

                    PreparedStatement ps = con.prepareStatement("select * from attendance where rno=? and month=? and year=?");
                    ps.setString(1, rno);
                    ps.setString(2, month);
                    ps.setString(3, year);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
    %>
    <script>
        alert("Attendance for Roll No. already exists.");
        window.location.href = "caretakerbed.jsp";
    </script>
    <%
    } else {
        String qry = "insert into attendance(rno,month,year,days) values('" + rno + "','" + month + "','" + year + "','" + days + "')";
        int i = stmt.executeUpdate(qry);
        if (i > 0) {

    %>
    <script>
        alert("Successfully Inserted.");
        window.location.href = "caretakerbed.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Insertion failed.");
        window.location.href = "caretakerbed.jsp";
    </script>
    <%
            }
        }
    } else {
    %>
    <script>
        alert("Student Details with the Roll No. Doesn't exist.");
        window.location.href = "caretakerbed.jsp";
    </script>
    <%
                }
                con.close();

            }

        } catch (Exception e) {
            out.println(e);
        }
    %>  
</html>
