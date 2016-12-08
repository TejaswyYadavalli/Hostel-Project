<%-- 
    Document   : FeeUpdate
    Created on : 16-Sep-2015, 06:43:34
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
        <link href="css/feedetails_style.css" rel="stylesheet" type="text/css"/>
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

            Update Fee Details 
        </nav>
        <br /> 
        <br />
        <%
            try {
                String rno = request.getParameter("feeupdate");
                String rno1 = "";
                String accno = "";
                String month = "";
                String year = "";
                String mbill = "";
                String esst = "";
                String rent = "";
                String wecharges = "";
                String food = "";
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from feedetails where rno=?");
                ps.setString(1, rno);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    rno1 = String.valueOf(rs.getString(1));
                    accno = String.valueOf(rs.getString(2));
                    month = String.valueOf(rs.getString(3));
                    year = String.valueOf(rs.getString(4));
                    mbill = String.valueOf(rs.getString(5));
                    esst = String.valueOf(rs.getString(6));
                    rent = String.valueOf(rs.getString(7));
                    wecharges = String.valueOf(rs.getString(8));
                    food = String.valueOf(rs.getString(9));
                }


        %>

        <div id="content">

            <form action="FeeUpdateDB.jsp" method="post" name="fee" onSubmit="return payclerk2(this);">
                <div id="FeeDetails">
                    <table id="table1">
                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="rno1" value="<%=rno1%>" readonly/></td>

                            <td  id="style1">Account No :</td>
                            <td><input type="text"  name="accno" value="<%=accno%>">
                            </td>
                        </tr>
                        <tr>

                            <td id="style1">Month :</td>
                            <td><select id="mselection" name="select" >
                                    <option value="<%=month%>" <%= (month.equals("jan") ? "selected='selected'" : "")%>>January</option>
                                    <option value="<%=month%>" <%= (month.equals("feb") ? "selected='selected'" : "")%>>February</option>
                                    <option value="<%=month%>" <%= (month.equals("mar") ? "selected='selected'" : "")%>>March</option>
                                    <option value="<%=month%>" <%= (month.equals("apr") ? "selected='selected'" : "")%>>April</option>
                                    <option value="<%=month%>" <%= (month.equals("may") ? "selected='selected'" : "")%>>May</option>
                                    <option value="<%=month%>" <%= (month.equals("jun") ? "selected='selected'" : "")%>>June</option>
                                    <option value="<%=month%>" <%= (month.equals("jul") ? "selected='selected'" : "")%>>July</option>
                                    <option value="<%=month%>" <%= (month.equals("aug") ? "selected='selected'" : "")%>>August</option>
                                    <option value="<%=month%>" <%= (month.equals("sep") ? "selected='selected'" : "")%>>September</option>
                                    <option value="<%=month%>" <%= (month.equals("oct") ? "selected='selected'" : "")%>>October</option>
                                    <option value="<%=month%>" <%= (month.equals("nov") ? "selected='selected'" : "")%>>November</option>
                                    <option value="<%=month%>" <%= (month.equals("dec") ? "selected='selected'" : "")%>>December</option>
                                </select></td>


                            <td id="style1">Year :</td>
                            <td><select id="mselection" name="select1">
                                    <option value="<%=year%>" <%= (year.equals("2012") ? "selected='selected'" : "")%>>2012</option>
                                    <option value="<%=year%>" <%= (year.equals("2013") ? "selected='selected'" : "")%>>2013</option>
                                    <option value="<%=year%>" <%= (year.equals("2014") ? "selected='selected'" : "")%>>2014</option>
                                    <option value="<%=year%>" <%= (year.equals("2015") ? "selected='selected'" : "")%>>2015</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td id="style1">Monthly Bill :</td>
                            <td class="style1"><input type="text" name="mbill" value="<%=mbill%>" /></td>


                            <td id="style1">Establishment Rate :</td>
                            <td><input type="text" name="esst" value="<%=esst%>" /></td>
                        </tr>

                        <tr>

                            <td id="style1">Room Rent :</td>
                            <td><input type="text" name="Rrent" value="<%=rent%>" /></td>


                            <td id="style1">Water/Electricity charges :</td>
                            <td><input type="text" name="wecharges" value="<%=wecharges%>" /></td>
                        </tr>

                        <tr>
                            <td id="style1">Food Type :</td>
                            <td>
                                <input type="radio" name="ftype" value="<%=food%>" checked="checked">Veg
                                <input type="radio" name="ftype" value="<%=food%>">Non-Veg
                            </td>



                        </tr>

                        <tr>
                            <td>
                            </td>

                            <td>
                                <input type="submit" class="styled-button-1" name="b2clerk" value="Update" /> 
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

