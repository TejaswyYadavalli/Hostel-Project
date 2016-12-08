<%-- 
    Document   : clerkDB
    Created on : 11 Sep, 2015, 3:11:51 PM
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
        <title>Clerk Functions</title>
    </head>


    <%
        try {
            String selected = request.getParameter("bclerk");
            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();
            String rno = request.getParameter("rno");
            String accno = request.getParameter("accno");
            String date = request.getParameter("date");
            String amt = request.getParameter("amt");
            String cno = request.getParameter("cno");

            if (selected.equals("Insert")) {
                PreparedStatement ps1 = con.prepareStatement("select * from studentdetails where rno=?");
                ps1.setString(1, rno);
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    String qry = "insert into billdetails(rno,accno,date,amt,cno) values('" + rno + "','" + accno + "','" + date + "','" + amt + "','" + cno + "')";
                    int i = stmt.executeUpdate(qry);
                    if (i > 0) {
    %>
    <script>
        alert("Successfully Inserted.");
        window.location.href = "clerk.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Insertion failed.");
        window.location.href = "clerk.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("Student Details with the Roll No. don't exist.Insert Student deatils.");
    </script>
    <%
        }

    } else if (selected.equals("Retrieve")) {
     
            PreparedStatement ps = con.prepareStatement("select * from billdetails where rno=? or accno=? or date=? or amt=? or cno=?");
            ps.setString(1, rno);
            ps.setString(2, accno);
            ps.setString(3, date);
            ps.setString(4, amt);
            ps.setString(5, cno);

            ResultSet rs = ps.executeQuery();
    %>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
    <link href="css/billdetails_style.css" rel="stylesheet" type="text/css"/>
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
                        <li><a href="clerk.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Clerk</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Clerk</h1>
            </div>

        </div>
        <nav class="main-nav" style="text-align: center; padding-top: 5px; color: #B0EBAD; font-size: 20px;">

            Student Bill Details 
        </nav>
        <br /> 
        <br />


        <div id="content">

            <div id="BillDetails">
                <table id="table1" style="border:1px">

                    <tr>
                        <th id="style1">Roll No.</th>
                        <th id="style1">Account No.</th>
                        <th id="style1">Date</th>
                        <th id="style1">Amount</th>
                        <th id="style1">Challan No.</th>
                    </tr>
                    <%
                        while (rs.next()) {
                    %>

                    <tr>
                        <td id="style1"><%=rs.getString(1)%></td>
                        <td id="style1"><%=rs.getString(2)%></td>
                        <td id="style1"><%=rs.getString(3)%></td>
                        <td id="style1"><%=rs.getString(4)%></td>
                        <td id="style1"><%=rs.getString(5)%></td>
                        <td>
                            <div>
                                <form method ="Post" action="clerkBillUpdate.jsp" name="bill">
                                    <input type="hidden" name="billupdate" value="<%=String.valueOf(rs.getString(1))%>">
                                    <input type="submit" class="styled-button-1" value="MODIFY">       
                                </form>
                            </div>
                        </td>
                    </tr>

                    <% } %>
                </table>
            </div>
        </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>  
</html>
