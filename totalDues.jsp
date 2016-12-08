<%-- 
    Document   : index
    Created on : 10-Aug-2015, 18:02:30
    Author     :  tejaswy
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
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
    </head>
    <%
        String rollno = request.getParameter("Rno1");
        String name = "";
        String food = "";
        int days = 0;
        double mbill = 0.0;
        double rent = 0.0;
        double esst = 0.0;
        double we = 0.0;
        double totalmonth = 0.0;
        double amt = 0.0;
        double dues = 0.0;
        try {

            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("Select s.name,a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a where s.rno=f.rno and s.rno=a.rno and f.month=a.month and f.year=a.year and s.rno=?");
            ps.setString(1, rollno);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
                days = rs.getInt(2);
                mbill = rs.getDouble(3);
                food = rs.getString(4);
                esst = rs.getDouble(5);
                rent = rs.getDouble(6);
                we = rs.getDouble(7);
                if (food.equalsIgnoreCase("Non-Veg")) {
                    totalmonth = totalmonth + (days * mbill) + esst + rent + we+50;
                }
                else
                {
                    totalmonth = totalmonth + (days * mbill) + esst + rent + we;
                }
            }

            PreparedStatement ps1 = con.prepareStatement("Select sum(amt) from billdetails where rno=?");
            ps1.setString(1, rollno);
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                amt = rs1.getDouble(1);
            }

            dues = totalmonth - amt;
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
            <div id="title" style="left: -50px">
                <H1>Total Dues</h1>
            </div>
        </div>
        <nav class="main-nav">

            <ul class="nav-list">

            </ul>

        </nav>


        <br /> 
        <br />

        <div id="content">
            <form>
                <table id="table1">
                    <tr>


                        <td id="style1">Name :</td>
                        <td class="style1"><input type="text" name="Rno" value="<%=name%>" disabled/></td>

                        <td id="style1">Total Amount:</td>
                        <td class="style1"><input type="text" name="tolamt" value="<%=totalmonth%>" disabled/></td>
                    </tr>
                    <tr>
                        <td id="style1">Total Fee Paid:</td>
                        <td class="style1"><input type="text" name="tol" value="<%=amt%>"  disabled/></td>


                        <td  id="style1">Dues:</td>
                        <td class="style1"><input type="text" name="dues" value="<%=dues%>" disabled/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


    </body>

</html>
