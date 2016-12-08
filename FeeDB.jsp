<%-- 
    Document   : FeeDB
    Created on : 16-Sep-2015, 06:43:11
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
            String selected = request.getParameter("b2clerk");
            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();
            String rno = request.getParameter("rno1");
            String accno = request.getParameter("accno");
            String month = request.getParameter("select");
            String year = request.getParameter("select1");
            String mbill = request.getParameter("mbill");
            String esst = request.getParameter("esst");
            String rent = request.getParameter("Rrent");
            String wecharges = request.getParameter("wecharges");
            String food = request.getParameter("ftype");

            if (selected.equals("Insert")) {
                PreparedStatement ps1 = con.prepareStatement("select * from studentdetails where rno=?");
                ps1.setString(1, rno);
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    String qry = "insert into feedetails(rno,accno,month,year,mbill,esst,rent,wecharges,food) values('" + rno + "','" + accno + "','" + month + "','" + year + "','" + mbill + "','" + esst + "','" + rent + "','" + wecharges + "','" + food + "')";
                    int i = stmt.executeUpdate(qry);
                    if (i > 0) {

    %>
    <script>
        alert("Successfully Inserted.");
        window.location.href = "clerk.jsp";
    </script>
    <%--<jsp:include page="clerk.jsp"/>--%>
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
        alert("Student Details with the Roll No. Doesn't exist.Insert Student deatils.");
    </script>
    <%
        }
    } else if (selected.equals("Retrieve")) {

        PreparedStatement ps = con.prepareStatement("select * from feedetails where rno=? or accno=? or month=? or year=? or mbill=? or esst=? or rent=? or wecharges=? or food=?");
        ps.setString(1, rno);
        ps.setString(2, accno);
        ps.setString(3, month);
        ps.setString(4, year);
        ps.setString(5, mbill);
        ps.setString(6, esst);
        ps.setString(7, rent);
        ps.setString(8, wecharges);
        ps.setString(9, food);

        ResultSet rs1 = ps.executeQuery();
    %>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
    <link href="css/feedetails_style.css" rel="stylesheet" type="text/css"/>
    <body>
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

            Student Fee Details 
        </nav>
        <br /> 
        <br />


        <div id="content">

            <div id="FeeDetails">
                <table id="table1" style="border:1px">

                    <tr>
                        <th id="style1">Roll No.</th>
                        <th id="style1">Account No.</th>
                        <th id="style1">Month.</th>
                        <th id="style1">Year.</th>
                        <th id="style1">Monthly Bill.</th>
                        <th id="style1">Establishment Rate.</th>
                        <th id="style1">Room Rent.</th>
                        <th id="style1">Water/Electricity Charges.</th>
                        <th id="style1">Food Type.</th>
                    </tr>
                    <%
                        while (rs1.next()) {
                    %>

                    <tr>
                        <td id="style1"><%=rs1.getString(1)%></td>
                        <td id="style1"><%=rs1.getString(2)%></td>
                        <td id="style1"><%=rs1.getString(3)%></td>
                        <td id="style1"><%=rs1.getString(4)%></td>
                        <td id="style1"><%=rs1.getString(5)%></td>
                        <td id="style1"><%=rs1.getString(6)%></td>
                        <td id="style1"><%=rs1.getString(7)%></td>
                        <td id="style1"><%=rs1.getString(8)%></td>
                        <td id="style1"><%=rs1.getString(9)%></td>

                        <td>
                            <div>
                                <form method ="Post" action="FeeUpdate.jsp" name="fee">
                                    <input type="hidden" name="feeupdate" value="<%=String.valueOf(rs1.getString(1))%>">
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

