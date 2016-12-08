<%-- 
    Document   : caretaker
    Created on : Aug 12, 2015, 2:04:58 PM
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
        <link href="css/caretakerbed_style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <title>CareTaker</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bedCareTakerValidate.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            try {
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                if (session.getAttribute("unamep") == null) {
                    response.sendRedirect("index.jsp");
                } else {
                }
            } catch (Exception ex) {
                out.println(ex);
            }
        %>

        <div id="header">
            <nav class="nav">
                <div id="menu-list">
                    <ul class="list">

                        <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>
                        <li><a href="caretakerbed.jsp" id="caretaker" target="_self" class="fa w3-left">Caretaker</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1 style="margin-left: -20px;">Caretaker</h1>
            </div>
        </div>
        <div id="menu">

            <nav class="main-nav" style="text-align: center; padding-top: 5px; color: #B0EBAD; font-size: 20px;">

                Occupancy Details
            </nav>

        </div>

        <%
            String hname = request.getParameter("hname");
            int capacity = 0;
            int occupancy = 0;
            int vacancy = 0;

            try {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT nbed from hosteldetails WHERE hname= ?");
                ps.setString(1, hname);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {

                    capacity = rs.getInt(1);
                }

                String query = "SELECT count(*) FROM `" + hname + "` WHERE bedstatus = ?";
                PreparedStatement ps1 = con.prepareStatement(query);
                ps1.setString(1, "inactive");
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    occupancy = rs1.getInt(1);
                }

                String query1 = "SELECT count(*) FROM `" + hname + "` WHERE bedstatus = ?";
                PreparedStatement ps2 = con.prepareStatement(query1);
                ps2.setString(1, "active");
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    vacancy = rs2.getInt(1);
                }

                con.close();
            } catch (Exception e) {
                out.println(e);
            }

        %>
        <div id="content">
            <br/>
            <br/>


            <form id="formEntry" name="careTaker">

                <div id="occupancy">

                    <table id="table1">
                        <tr>
                            <td id="style1">Hostel Name:</td>
                            <td><input type="text" name="name" id="hn" value="<%=hname%>" readonly/> </td>
                        </tr>
                        <tr>
                            <td id="style1">Total Capacity:</td>
                            <td><input type="text" name="capacity" id="tc" value="<%=capacity%>" readonly/> </td>
                        </tr>
                        <tr>
                            <td id="style1">Total Occupancy:</td>
                            <td><input type="text" name="occupancy" id="to" value="<%=occupancy%>" readonly/> </td>
                        </tr>
                        <tr>
                            <td id="style1">Total Vacancy:</td>
                            <td><input type="text" name="vacancy" id="tv" value="<%=vacancy%>" readonly/> </td>
                        </tr>
                    </table>

                </div>
            </form>
        </div>
    </body>
</html>