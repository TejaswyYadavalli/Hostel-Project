<%-- 
    Document   : All
    Created on : Aug 11, 2015, 6:25:48 PM
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
        <title>Hostel fee Details</title>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <link href="css/hostelDetails.css" rel="stylesheet" type="text/css"/>

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
                        <li><a href="hostelManager.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Hostel Manager</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Hostel Fee Details</h1>
            </div>
        </div>

        <div id="menu">

        </div>
        <%
            String hostelT = request.getParameter("hostelSelect");
            String hostelT1="";
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
            double total = 0.0;
            double amt = 0.0;
            double dues = 0.0;
            if(hostelT.equalsIgnoreCase("All Boys"))
            {
             hostelT1="male";   
            }
            else if(hostelT.equalsIgnoreCase("All Girls"))
            {
             hostelT1="female";    
            }
            try {

                Connection con = DB.getConnection();

                if ((hostelT.equalsIgnoreCase("All Boys")) || (hostelT.equalsIgnoreCase("All Girls"))) {
                    PreparedStatement ps = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year and a.month=? and a.year=? and s.gender=?");
                    ps.setString(1, month);
                    ps.setString(2, year);
                    ps.setString(3, hostelT1);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        days = rs.getInt(1);
                        mbill = rs.getDouble(2);
                        food = rs.getString(3);
                        esst = rs.getDouble(4);
                        rent = rs.getDouble(5);
                        we = rs.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            totalmonth = (days * mbill) + esst + rent + we + 50;
                        } else {
                            totalmonth = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps1 = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year and s.gender=?");
                    ps1.setString(1, hostelT1);
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        days = rs1.getInt(1);
                        mbill = rs1.getDouble(2);
                        food = rs1.getString(3);
                        esst = rs1.getDouble(4);
                        rent = rs1.getDouble(5);
                        we = rs1.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            total = (days * mbill) + esst + rent + we + 50;
                        } else {
                            total = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps2 = con.prepareStatement("Select b.amt from studentdetails s,feedetails f,attendance a,studentstay st,billdetails b where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and s.rno=b.rno and s.gender=?");
                    ps2.setString(1, hostelT1);
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        amt=amt+rs2.getDouble(1);
                    }

                } else if (hostelT.equalsIgnoreCase("All")) {

                    PreparedStatement ps = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year and a.month=? and a.year=?");
                    ps.setString(1, month);
                    ps.setString(2, year);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        days = rs.getInt(1);
                        mbill = rs.getDouble(2);
                        food = rs.getString(3);
                        esst = rs.getDouble(4);
                        rent = rs.getDouble(5);
                        we = rs.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            totalmonth = (days * mbill) + esst + rent + we + 50;
                        } else {
                            totalmonth = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps1 = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year");
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        days = rs1.getInt(1);
                        mbill = rs1.getDouble(2);
                        food = rs1.getString(3);
                        esst = rs1.getDouble(4);
                        rent = rs1.getDouble(5);
                        we = rs1.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            total = (days * mbill) + esst + rent + we + 50;
                        } else {
                            total = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps2 = con.prepareStatement("Select b.amt from studentdetails s,feedetails f,attendance a,studentstay st,billdetails b where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and s.rno=b.rno");
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        amt=amt+rs2.getDouble(1);
                    }

                } else {
                    PreparedStatement ps = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year and a.month=? and a.year=? and st.hostelname=?");
                    ps.setString(1, month);
                    ps.setString(2, year);
                    ps.setString(3, hostelT);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        days = rs.getInt(1);
                        mbill = rs.getDouble(2);
                        food = rs.getString(3);
                        esst = rs.getDouble(4);
                        rent = rs.getDouble(5);
                        we = rs.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            totalmonth = (days * mbill) + esst + rent + we + 50;
                        } else {
                            totalmonth = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps1 = con.prepareStatement("Select a.days,f.mbill,f.food,f.esst,f.rent,f.wecharges from studentdetails s,feedetails f,attendance a,studentstay st where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and f.month=a.month and f.year=a.year and st.hostelname=?");
                    ps1.setString(1, hostelT);
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        days = rs1.getInt(1);
                        mbill = rs1.getDouble(2);
                        food = rs1.getString(3);
                        esst = rs1.getDouble(4);
                        rent = rs1.getDouble(5);
                        we = rs1.getDouble(6);
                        if (food.equalsIgnoreCase("Non-Veg")) {
                            total = (days * mbill) + esst + rent + we + 50;
                        } else {
                            total = (days * mbill) + esst + rent + we;
                        }
                    }

                    PreparedStatement ps2 = con.prepareStatement("Select b.amt from studentdetails s,feedetails f,attendance a,studentstay st,billdetails b where s.rno=f.rno and s.rno=a.rno and s.rno=st.rno and s.rno=b.rno and st.hostelname=?");
                    ps2.setString(1, hostelT);
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        amt=amt+rs2.getDouble(1);
                    }
                }
                dues = total - amt;
                con.close();
            } catch (Exception e) {
                out.println(e);
            }


        %>

        <div id="content">
            <form id="form1" action="messdetails.jsp">
                <div>              
                </div> 
                <br />
                <br />
                <table id="table1">
                    <tr>
                        <td id="style1">Hostel Type:</td>
                        <td class="style1"><input type="text" value="<%=hostelT%>" readonly/></td>

                        <td id="style1">Month:</td>
                        <td class="style1"><input type="text" value="<%=month%>" readonly/></td>
                    </tr>
                    <tr>
                        <td id="style1">Year:</td>
                        <td class="style1"><input type="text" value="<%=year%>" readonly/></td>

                        <td id="style1">Amount for the month:</td>
                        <td class="style1"><input type="text" name="tolamttopay" value="<%=totalmonth%>" readonly/></td>
                    </tr>

                    <tr> 
                        <th></th>
                        <th> --Total Amount--</th>
                    </tr>
                    <tr>
                        <td id="style1">Total amount to be paid:</td>
                        <td class="style1"><input type="text" name="tolamttopay" value="<%=total%>" readonly/></td>

                        <td id="style1">Total Amount paid:</td>
                        <td class="style1"><input type="text" name="tolfeepaid" value="<%=amt%>" readonly/></td>
                    </tr>
                    <tr>
                        <td  id="style1">Dues:</td>
                        <td class="style1"><input type="text" name="dues" value="<%=dues%>" readonly/></td>  
                    </tr>
                    <br>
                    <br>

                </table> 
            </form>
        </div>
    </body>

</html>

