<%-- 
    Document   : monthlymessdetails1
    Created on : Oct 5, 2015, 8:02:50 PM
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
        <title>Monthly Mess Details</title>
        <link href="css/StudentMessDetails_style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
    </head>
    <%
        String rollno = request.getParameter("Rno");
        String month = request.getParameter("mselection");
        String year = request.getParameter("yselection");
        String name = "";
        String food = "";
        int days = 0;
        double mbill = 0.0;
        double rent = 0.0;
        double esst = 0.0;
        double we = 0.0;
        double totalmonth = 0.0;

        try {

            Connection con = DB.getConnection();
            PreparedStatement ps1 = con.prepareStatement("Select * from studentdetails where rno=?");
            ps1.setString(1, rollno);
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {

                PreparedStatement ps = con.prepareStatement("Select s.name,a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a where s.rno=f.rno and s.rno=a.rno and f.month=a.month and f.year=a.year and s.rno=? and a.month=? and a.year=?");
                ps.setString(1, rollno);
                ps.setString(2, month);
                ps.setString(3, year);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    name = rs.getString(1);
                    days = rs.getInt(2);
                    mbill = rs.getDouble(3);
                    food = rs.getString(4);
                    esst = rs.getDouble(5);
                    rent = rs.getDouble(6);
                    we = rs.getDouble(7);
                }
                totalmonth = (days * mbill) + esst + rent + we;
                if (food.equalsIgnoreCase("Non-Veg")) {
                    totalmonth = totalmonth + 50;
                } else {
    %>
    <script>
        alert("Attendance or Fee Details don't exist for the Roll No.");
        window.location.href="studentinfo.jsp";
    </script>
    <%
        }

    } else {
    %>
    <script>
        alert("Student Details don't exist");
        window.location.href="studentinfo.jsp";
    </script>
    <%
            }
            con.close();
        } catch (Exception e) {
            out.println(e);
        }

    %>

    <body>
        <%            try {
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
                        <li><a href="PaymentLogin.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Payment Login</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>
            <div id="title" style="left: -70px">
                <H1>Monthly Details</h1>
            </div>
        </div>
        <nav class="main-nav">

            <ul class="nav-list">

            </ul>

        </nav>
        <br />
        <br />
        <div id="content">
            <form id="form1" action="">
                <table id="table1">
                    <tr>

                        <td id="style1">Name :</td>
                        <td class="style1"><input type="text" value="<%=name%>" name="name" disabled/></td>


                        <td  id="style1">Days :</td>
                        <td><input type="text"  name="days" value="<%=days%>" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td id="style1">Establishment Rate :</td>
                        <td><input type="text" name="esst" value="<%=esst%>" disabled/></td>


                        <td id="style1">Room Rent :</td>
                        <td><input type="text" name="roomtrent" value="<%=rent%> "disabled/></td>
                    </tr>
                    <tr> 
                        <td id="style1">Water/Electricity charges :</td>
                        <td><input type="text" name="Wecharges" value="<%=we%>" disabled/></td>


                        <td id="style1">Food Type :</td>
                        <td>
                            <input type="radio" name="ftype" value="<%=food%>" <%= (food.equals("Veg") ? "checked='checked'" : "")%>>Veg
                            <input type="radio" name="ftype" value="<%=food%>" <%= (food.equals("Non-Veg") ? "checked='checked'" : "")%>>Non-Veg
                        </td>
                    </tr>
                    <tr>
                        <td id="style1">Total Monthly Bill:</td>
                        <td><input type="text" name="tol" value="<%=totalmonth%>" disabled/></td>
                    </tr>
                </table> 
            </form>
        </div>
    </body>
</html>
