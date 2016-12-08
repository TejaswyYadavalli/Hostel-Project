<%-- 
    Document   : index
    Created on : 10-Aug-2015, 18:02:30
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
        <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/billdetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/payclerk.js" type="text/javascript"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#paydate").datepicker({
                    changeMonth: true,
                    changeYear: true
                });
            });



        </script>


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

            Update Bill Details 
        </nav>
        <br /> 
        <br />
        <%
            try {
                String rno = request.getParameter("billupdate");
                String rno1="";
                String accno="";
                String date="";
                String amt="";
                String cno="";
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from billdetails where rno=?");
                ps.setString(1, rno);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                rno1 = String.valueOf(rs.getString(1));
                accno = String.valueOf(rs.getString(2));
                date= String.valueOf(rs.getString(3));
                amt = String.valueOf(rs.getString(4));
                cno = String.valueOf(rs.getString(5));
                }


        %>

        <div id="content">

            <form action="clerkBillUpdateDB.jsp" method="post" name="bill" onSubmit="return payclerk1(this);">
                <div id="BillDetails">
                    <table id="table1">
                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="rno" value="<%=rno1%>" readonly/></td>

                            <td id="style1">Account No :</td>
                            <td class="style1"><input type="text" name="accno" value="<%=accno%>"/></td>
                        </tr>
                        <tr>

                        <tr>
                            <td id="style1">Date :</td>
                            <td><input type="text" name="date" id="paydate" value="<%=date%>"/></td>

                            <td id="style1">Amount :</td>
                            <td><input type="text" name="amt" value="<%=amt%>"/></td>
                        </tr>

                        <tr>

                            <td id="style1">Challon No :</td>
                            <td><input type="text" name="cno" value="<%=cno%>"/></td>



                        </tr>
                        <tr>
                            <td>
                            </td>

                            <td>
                                <input type="submit" class="styled-button-1" name="bclerk" value="Update" /> 
                            </td>


                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <%
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>

    </body>
</html>
