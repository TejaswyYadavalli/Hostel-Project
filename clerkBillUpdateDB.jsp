<%-- 
    Document   : clerkBillUpdateDB
    Created on : 15 Sep, 2015, 9:43:11 PM
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
            String rno = request.getParameter("rno");
            String accno = request.getParameter("accno");
            String date = request.getParameter("date");
            String amt = request.getParameter("amt");
            String cno = request.getParameter("cno");
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE billdetails SET rno = ?, accno = ?, date = ?, amt =?, cno = ? WHERE rno = ?");
            ps.setString(1, rno);
            ps.setString(2, accno);
            ps.setString(3, date);
            ps.setString(4, amt);
            ps.setString(5, cno);
            ps.setString(6, rno);
            int i = ps.executeUpdate();
            if (i > 0) {

    %>
    <script>
        alert("Successfully Updated.");
        window.location.href = "clerk.jsp";
    </script>
    <%--<jsp:include page="clerk.jsp"/>--%>


    <%  } else {
    %>
    <script>
        alert("Updation failed.Try Again");
        window.location.href = "clerkBillUpdate.jsp";
    </script>
    <%
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>
</html>
