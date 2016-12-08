<%-- 
    Document   : StudentUpdateDB
    Created on : 15-Sep-2015, 23:29:13
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
            String rno = request.getParameter("Rno");
            String name = request.getParameter("Name");
            String address = request.getParameter("Address");
            String sphno = request.getParameter("Phno");
            String fname = request.getParameter("fName");
            String empdetails = request.getParameter("Emp");
            String fphno = request.getParameter("fPhno");
            String aincome = request.getParameter("Income");
            String admtest = request.getParameter("adm");
            String rank = request.getParameter("Rank");
            String state = request.getParameter("State");
            String country = request.getParameter("Country");
            String category = request.getParameter("Category");
            String gender = request.getParameter("Gender");
            String dob = request.getParameter("date");
            String mstatus = request.getParameter("Marital Status");
            String saadhar = request.getParameter("Aadhar");
            String faadhar = request.getParameter("fAadhar");
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE studentdetails SET rno = ?, name = ?, address = ?, sphno = ?,fname = ?, empdetails = ?, fphno = ?, aincome = ?, admtest = ?, rank = ?, state = ?, country = ?, category = ?, dob = ?, mstatus = ?, saadhar = ?, faadhar = ?,gender=?  WHERE rno = ?");
            ps.setString(1, rno);
            ps.setString(2, name);
            ps.setString(3, address);
            ps.setString(4, sphno);
            ps.setString(5, fname);
            ps.setString(6, empdetails);
            ps.setString(7, fphno);
            ps.setString(8, aincome);
            ps.setString(9, admtest);
            ps.setString(10, rank);
            ps.setString(11, state);
            ps.setString(12, country);
            ps.setString(13, category);
            ps.setString(14, dob);
            ps.setString(15, mstatus);
            ps.setString(16, saadhar);
            ps.setString(17, faadhar);
            ps.setString(18, gender);
            ps.setString(19, rno);

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
        window.location.href = "StudentUpdate.jsp";
    </script>
    <%
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>
</html>
