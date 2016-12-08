<%-- 
    Document   : insertmanjeera
    Created on : 19 Sep, 2015, 1:33:40 PM
    Author     : tejaswy
--%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="DBConnection.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Connection con = DB.getConnection();
        int id = 701;
        int no = 1;
        int roomno = 1;
        try {
            while (no <= 160) {
                PreparedStatement ps = con.prepareStatement("insert into kamalanehru values(?,?,?,?,?)");
                ps.setInt(1, id);
                ps.setInt(2, 0);
                ps.setInt(3, no);
                ps.setString(4, "active");
                ps.setInt(5, roomno);
                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("success");
                    if (no % 4 == 0) {
                        roomno++;
                    }

                    no++;
                    id++;

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    %>
</html>
